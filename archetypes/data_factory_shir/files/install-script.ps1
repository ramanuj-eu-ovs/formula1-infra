param(
 [string]
 $gatewayKey
)

function Run-Process([string] $phase, [string] $process, [string] $arguments, [bool] $SilentlyContinue)
{
	$DataStamp = get-date -Format yyyyMMddTHHmmss
	$logFile = 'stdout-{0}-{1}.log' -f $phase,$DataStamp
	$errorFile = 'stderr-{0}-{1}.log' -f $phase,$DataStamp

	$proc = Start-Process -FilePath $process -ArgumentList $arguments -Wait -Passthru -NoNewWindow -RedirectStandardError $errorFile -RedirectStandardOutput $logFile
	if($proc.ExitCode -ne 0)
	{
		$errContent = [string] (Get-Content -Path $errorFile -Delimiter "!!!DoesNotExist!!!")
		$logContent = [string] (Get-Content -Path $logFile -Delimiter "!!!DoesNotExist!!!")

		if(-not $SilentlyContinue)
		{
			throw "Failed to run process errContent=$errContent, outContent=$logContent."
		}
	}
}

function Download-File([string] $url, [string] $gwPath)
{
	$client = New-Object System.Net.WebClient
    $client.DownloadFile($url, $gwPath)
}

function Install-Gateway([string] $gwPath)
{
	Run-Process "install" "msiexec.exe" "/i gateway.msi INSTALLTYPE=AzureTemplate /quiet /norestart" $false
	Start-Sleep -Seconds 45
}

# https://learn.microsoft.com/en-us/java/openjdk/install#install-via-msi
function Install-JDK([string] $javaPath, [string] $version)
{
	Run-Process "install-jdk" "msiexec.exe" "/i jdk.msi INSTALLLEVEL=2 /quiet /norestart" $false
}

function Get-RegistryProperty([string] $keyPath, [string] $property)
{
	$keyReg = Get-Item $keyPath
	return $keyReg.GetValue($property)
}

function Register-Gateway([string] $instanceKey)
{
	$filePath = Get-RegistryProperty "hklm:\Software\Microsoft\DataTransfer\DataManagementGateway\ConfigurationManager" "DiacmdPath"
	Run-Process "era" $filePath "-era 8060" $false
	Run-Process "register" $filePath "-k $instanceKey" $false
	Start-Sleep -Seconds 45
}

function Get-InstallerUrl([string] $version) {
    $uri = Get-RedirectedUrl
    $uri = $uri.Substring(0, $uri.LastIndexOf('/') + 1)
    $uri += "IntegrationRuntime_$version.msi"

    return $uri
}

function Get-RedirectedUrl {
    $URL = "https://go.microsoft.com/fwlink/?linkid=839822"

    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()

    If ($response.StatusCode -eq "Found") {
        $response.GetResponseHeader("Location")
    }
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::TLS12
if ((Get-Process "diahost" -ea SilentlyContinue) -eq $Null)
{
	# https://learn.microsoft.com/en-us/java/openjdk/download
	$jdkUri = "https://aka.ms/download-jdk/microsoft-jdk-17.0.6-windows-x64.msi"
	$jdkPath = "$PWD\jdk.msi"
	Download-File $jdkUri $jdkPath
	Install-JDK $jdkPath "17"

	$uri = Get-InstallerUrl "5.24.8369.1"
	$gwPath= "$PWD\gateway.msi"

	Download-File $uri $gwPath
	Install-Gateway $gwPath
	Register-Gateway $gatewayKey
}
