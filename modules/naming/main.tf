locals {
  // adding a first letter to guarantee that you always start with a letter
  prefix      = join("-", var.prefix)
  prefix_safe = lower(join("", var.prefix))
  suffix      = join("-", var.suffix)
  suffix_safe = lower(join("", var.suffix))
  // Names based in the recomendations of
  // https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging
  az = {

    analysis_services_server = {
      name       = substr(join("", compact([local.prefix_safe, "as", local.suffix_safe])), 0, 63)
      dashes     = false
      slug       = "as"
      min_length = 3
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-z][a-z0-9]+$"
    }

    api_management = {
      name       = substr(join("", compact([local.prefix_safe, "apim", local.suffix_safe])), 0, 50)
      dashes     = false
      slug       = "apim"
      min_length = 1
      max_length = 50
      scope      = "global"
      regex      = "^[a-z][a-zA-Z0-9]+$"
    }

    app_configuration = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "appcg", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "appcg"
      min_length = 5
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_-]+$"
    }

    app_service = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "app", local.suffix])), 0, 60), "-")
      dashes     = true
      slug       = "app"
      min_length = 2
      max_length = 60
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]"
    }

    app_service_plan = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "plan", local.suffix])), 0, 40), "-")
      dashes     = true
      slug       = "plan"
      min_length = 1
      max_length = 40
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    application_gateway = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "agw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "agw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    application_insights = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "appi", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "appi"
      min_length = 10
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^%\\&?/]+$"
    }

    application_security_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asg", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "asg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    automation_account = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aa", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "aa"
      min_length = 6
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    automation_certificate = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aacert", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "aacert"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    automation_credential = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aacred", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "aacred"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    automation_runbook = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aacred", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "aacred"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+$"
    }

    automation_schedule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aasched", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "aasched"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    automation_variable = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aavar", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "aavar"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    availability_set = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "avail", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "avail"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+[a-zA-Z0-9_]$"
    }

    bastion_host = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "snap", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "snap"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    batch_account = {
      name       = substr(join("", compact([local.prefix_safe, "ba", local.suffix_safe])), 0, 24)
      dashes     = false
      slug       = "ba"
      min_length = 3
      max_length = 24
      scope      = "region"
      regex      = "^[a-z0-9]+$"
    }

    batch_application = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "baapp", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "baapp"
      min_length = 1
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9_-]+$"
    }

    batch_certificate = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "bacert", local.suffix])), 0, 45), "-")
      dashes     = true
      slug       = "bacert"
      min_length = 5
      max_length = 45
      scope      = "parent"
      regex      = "^[a-zA-Z0-9_-]+$"
    }

    batch_pool = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "bapool", local.suffix])), 0, 24), "-")
      dashes     = true
      slug       = "bapool"
      min_length = 3
      max_length = 24
      scope      = "parent"
      regex      = "^[a-zA-Z0-9_-]+$"
    }

    bot_channel_directline = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "botline", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "botline"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    bot_channel_email = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "botmail", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "botmail"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    bot_channel_ms_teams = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "botteams", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "botteams"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    bot_channel_slack = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "botslack", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "botslack"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    bot_channels_registration = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "botchan", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "botchan"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    bot_connection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "botcon", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "botcon"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    bot_web_app = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "bot", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "bot"
      min_length = 2
      max_length = 64
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    cdn_endpoint = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "cdn", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "cdn"
      min_length = 1
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    cdn_profile = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "cdnprof", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "cdnprof"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    cognitive_account = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "cog", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "cog"
      min_length = 2
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+$"
    }

    container_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "cg", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "cg"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    container_registry = {
      name       = substr(join("", compact([local.prefix_safe, "acr", local.suffix_safe])), 0, 63)
      dashes     = false
      slug       = "acr"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9]+$"
    }

    container_registry_webhook = {
      name       = substr(join("", compact([local.prefix_safe, "crwh", local.suffix_safe])), 0, 50)
      dashes     = false
      slug       = "crwh"
      min_length = 1
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9]+$"
    }

    cosmosdb_account = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "cosmos", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "cosmos"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-z0-9][a-z0-9-_.]+[a-z0-9]$"
    }

    custom_provider = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "prov", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "prov"
      min_length = 3
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[^&%?\\/]+[^&%.?\\/ ]$"
    }

    dashboard = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dsb", local.suffix])), 0, 160), "-")
      dashes     = true
      slug       = "dsb"
      min_length = 3
      max_length = 160
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    data_factory = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adf", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "adf"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    data_factory_dataset_mysql = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfmysql", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfmysql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }

    data_factory_dataset_postgresql = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfpsql", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfpsql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }

    data_factory_dataset_sql_server_table = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfmssql", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfmssql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }

    data_factory_integration_runtime_managed = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfir", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "adfir"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    data_factory_linked_service_data_lake_storage_gen2 = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfsvst", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfsvst"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }

    data_factory_linked_service_key_vault = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfsvkv", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfsvkv"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }

    data_factory_linked_service_mysql = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfsvmysql", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfsvmysql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }

    data_factory_linked_service_postgresql = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfsvpsql", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfsvpsql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }

    data_factory_linked_service_sql_server = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfsvmssql", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfsvmssql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }

    data_factory_pipeline = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adfpl", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adfpl"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }

    data_factory_trigger_schedule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "adftg", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "adftg"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }

    data_lake_analytics_account = {
      name       = substr(join("", compact([local.prefix_safe, "dla", local.suffix_safe])), 0, 24)
      dashes     = false
      slug       = "dla"
      min_length = 3
      max_length = 24
      scope      = "global"
      regex      = "^[a-z0-9]+$"
    }

    data_lake_analytics_firewall_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dlfw", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "dlfw"
      min_length = 3
      max_length = 50
      scope      = "parent"
      regex      = "^[a-z0-9-_]+$"
    }

    data_lake_store = {
      name       = substr(join("", compact([local.prefix_safe, "dls", local.suffix_safe])), 0, 24)
      dashes     = false
      slug       = "dls"
      min_length = 3
      max_length = 24
      scope      = "parent"
      regex      = "^[a-z0-9]+$"
    }

    data_lake_store_firewall_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dlsfw", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "dlsfw"
      min_length = 3
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    database_migration_project = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "migr", local.suffix])), 0, 57), "-")
      dashes     = true
      slug       = "migr"
      min_length = 2
      max_length = 57
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    database_migration_service = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dms", local.suffix])), 0, 62), "-")
      dashes     = true
      slug       = "dms"
      min_length = 2
      max_length = 62
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }

    databricks_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dbc", local.suffix])), 0, 30), "-")
      dashes     = true
      slug       = "dbc"
      min_length = 3
      max_length = 30
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    databricks_high_concurrency_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dbhcc", local.suffix])), 0, 30), "-")
      dashes     = true
      slug       = "dbhcc"
      min_length = 3
      max_length = 30
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    databricks_standard_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dbsc", local.suffix])), 0, 30), "-")
      dashes     = true
      slug       = "dbsc"
      min_length = 3
      max_length = 30
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    databricks_workspace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dbw", local.suffix])), 0, 30), "-")
      dashes     = true
      slug       = "dbw"
      min_length = 3
      max_length = 30
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    dev_test_lab = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "lab", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "lab"
      min_length = 1
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    dev_test_linux_virtual_machine = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "labvm", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "labvm"
      min_length = 1
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    dev_test_windows_virtual_machine = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "labvm", local.suffix])), 0, 15), "-")
      dashes     = true
      slug       = "labvm"
      min_length = 1
      max_length = 15
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    disk_encryption_set = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "des", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "des"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_]+$"
    }

    dns_a_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_aaaa_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_caa_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_cname_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_mx_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_ns_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_ptr_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_txt_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    dns_zone = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dns", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "dns"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    eventgrid_domain = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "egd", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "egd"
      min_length = 3
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    eventgrid_domain_topic = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "egdt", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "egdt"
      min_length = 3
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    eventgrid_event_subscription = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "egs", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "egs"
      min_length = 3
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    eventgrid_topic = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "egt", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "egt"
      min_length = 3
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    eventhub = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "evh", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "evh"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    eventhub_authorization_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ehar", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "ehar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    eventhub_consumer_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ehcg", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "ehcg"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    eventhub_namespace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ehn", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "ehn"
      min_length = 1
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    eventhub_namespace_authorization_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ehnar", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "ehnar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    eventhub_namespace_disaster_recovery_config = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ehdr", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "ehdr"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    express_route_circuit = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "erc", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "erc"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    express_route_gateway = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ergw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "ergw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    firewall = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "fw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    firewall_application_rule_collection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fwapp", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "fwapp"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    firewall_ip_configuration = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fwipconf", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "fwipconf"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    firewall_nat_rule_collection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fwnatrc", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "fwnatrc"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    firewall_network_rule_collection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fwnetrc", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "fwnetrc"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    frontdoor = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fd", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "fd"
      min_length = 5
      max_length = 64
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    frontdoor_firewall_policy = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "fdfw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "fdfw"
      min_length = 1
      max_length = 80
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    function_app = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "func", local.suffix])), 0, 60), "-")
      dashes     = true
      slug       = "func"
      min_length = 2
      max_length = 60
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_hadoop_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "hadoop", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "hadoop"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_hbase_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "hbase", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "hbase"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_interactive_query_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "iqr", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "iqr"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_kafka_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kafka", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "kafka"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_ml_services_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mls", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "mls"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_rserver_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rsv", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "rsv"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_spark_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "spark", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "spark"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    hdinsight_storm_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "storm", local.suffix])), 0, 59), "-")
      dashes     = true
      slug       = "storm"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    image = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "img", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "img"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+[a-zA-Z0-9_]$"
    }

    iotcentral_application = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "iotapp", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "iotapp"
      min_length = 2
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    iothub = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "iot", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "iot"
      min_length = 3
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }

    iothub_consumer_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "iotcg", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "iotcg"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-._]+$"
    }

    iothub_dps = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dps", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "dps"
      min_length = 3
      max_length = 64
      scope      = "resoureceGroup"
      regex      = "^[a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    iothub_dps_certificate = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dpscert", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "dpscert"
      min_length = 1
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-._]+$"
    }

    key_vault = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kv", local.suffix])), 0, 24), "-")
      dashes     = true
      slug       = "kv"
      min_length = 3
      max_length = 24
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    key_vault_certificate = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kvc", local.suffix])), 0, 127), "-")
      dashes     = true
      slug       = "kvc"
      min_length = 1
      max_length = 127
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    key_vault_key = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kvk", local.suffix])), 0, 127), "-")
      dashes     = true
      slug       = "kvk"
      min_length = 1
      max_length = 127
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    key_vault_secret = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kvs", local.suffix])), 0, 127), "-")
      dashes     = true
      slug       = "kvs"
      min_length = 1
      max_length = 127
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }

    kubernetes_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "aks", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "aks"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+[a-zA-Z0-9]$"
    }

    kusto_cluster = {
      name       = substr(join("", compact([local.prefix_safe, "kc", local.suffix_safe])), 0, 22)
      dashes     = false
      slug       = "kc"
      min_length = 4
      max_length = 22
      scope      = "global"
      regex      = "^[a-z][a-z0-9]+$"
    }

    kusto_database = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kdb", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "kdb"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9- .]+$"
    }

    kusto_eventhub_data_connection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "kehc", local.suffix])), 0, 40), "-")
      dashes     = true
      slug       = "kehc"
      min_length = 1
      max_length = 40
      scope      = "parent"
      regex      = "^[a-zA-Z0-9- .]+$"
    }

    lb = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "lb", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "lb"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    lb_nat_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "lbnatrl", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "lbnatrl"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    linux_virtual_machine = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vm", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "vm"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

    linux_virtual_machine_scale_set = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vmss", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "vmss"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

    local_network_gateway = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "lgw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "lgw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    log_analytics_workspace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "log", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "log"
      min_length = 4
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    machine_learning_workspace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mlw", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "mlw"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    managed_disk = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dsk", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "dsk"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_]+$"
    }

    maps_account = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "map", local.suffix])), 0, 98), "-")
      dashes     = true
      slug       = "map"
      min_length = 1
      max_length = 98
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+$"
    }

    mariadb_database = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mariadb", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "mariadb"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    mariadb_firewall_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mariafw", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "mariafw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    mariadb_server = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "maria", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "maria"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }

    mariadb_virtual_network_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mariavn", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "mariavn"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    mssql_database = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sqldb", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "sqldb"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    mssql_elasticpool = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sqlep", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "sqlep"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    mssql_server = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sql", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "sql"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    mysql_database = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mysqldb", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "mysqldb"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    mysql_firewall_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mysqlfw", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "mysqlfw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    mysql_server = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mysql", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "mysql"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }

    mysql_virtual_network_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "mysqlvn", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "mysqlvn"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    network_ddos_protection_plan = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ddospp", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "ddospp"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    network_interface = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "nic", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "nic"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    network_security_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "nsg", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "nsg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    network_security_group_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "nsgr", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "nsgr"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    network_security_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "nsgr", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "nsgr"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    network_watcher = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "nw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "nw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    notification_hub = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "nh", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "nh"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+$"
    }

    notification_hub_authorization_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 256), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 256
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+$"
    }

    notification_hub_namespace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 6
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    point_to_site_vpn_gateway = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vpngw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "vpngw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    postgresql_database = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "psqldb", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "psqldb"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    postgresql_firewall_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "psqlfw", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "psqlfw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    postgresql_server = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "psql", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "psql"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }

    postgresql_virtual_network_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "psqlvn", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "psqlvn"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    powerbi_embedded = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pbi", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "pbi"
      min_length = 3
      max_length = 63
      scope      = "region"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+$"
    }

    private_dns_a_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_aaaa_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_cname_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_mx_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_ptr_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_srv_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_txt_record = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnsrec", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_zone = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdns", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "pdns"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_dns_zone_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pdnszg", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pdnszg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    private_endpoint = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pe", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pe"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    private_link_service = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pls", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pls"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    private_service_connection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "psc", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "psc"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }

    proximity_placement_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ppg", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "ppg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    public_ip = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pip", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pip"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    public_ip_prefix = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "pippf", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "pippf"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    recovery_services_vault = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rsv", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "rsv"
      min_length = 2
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    redis_cache = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "redis", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "redis"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    redis_firewall_rule = {
      name       = substr(join("", compact([local.prefix_safe, "redisfw", local.suffix_safe])), 0, 256)
      dashes     = false
      slug       = "redisfw"
      min_length = 1
      max_length = 256
      scope      = "parent"
      regex      = "^[a-zA-Z0-9]+$"
    }

    relay_hybrid_connection = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rlhc", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "rlhc"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    relay_namespace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rln", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "rln"
      min_length = 6
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    resource_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rg", local.suffix])), 0, 90), "-")
      dashes     = true
      slug       = "rg"
      min_length = 1
      max_length = 90
      scope      = "subscription"
      regex      = "^[a-zA-Z0-9-._\\(\\)]+[a-zA-Z0-9-_\\(\\)]$"
    }

    role_assignment = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "ra", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "ra"
      min_length = 1
      max_length = 64
      scope      = "assignment"
      regex      = "^[^%]+[^ %.]$"
    }

    role_definition = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rd", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "rd"
      min_length = 1
      max_length = 64
      scope      = "definition"
      regex      = "^[^%]+[^ %.]$"
    }

    route = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "rt", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "rt"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    route_table = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "route", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "route"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    service_fabric_cluster = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sf", local.suffix])), 0, 23), "-")
      dashes     = true
      slug       = "sf"
      min_length = 4
      max_length = 23
      scope      = "region"
      regex      = "^[a-z][a-z0-9-]+[a-z0-9]$"
    }

    servicebus_namespace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sb", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "sb"
      min_length = 6
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    servicebus_namespace_authorization_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sbar", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "sbar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    servicebus_queue = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sbq", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "sbq"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    servicebus_queue_authorization_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sbqar", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "sbqar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    servicebus_subscription = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sbs", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "sbs"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    servicebus_subscription_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sbsr", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "sbsr"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    servicebus_topic = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sbt", local.suffix])), 0, 260), "-")
      dashes     = true
      slug       = "sbt"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    servicebus_topic_authorization_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "dnsrec", local.suffix])), 0, 50), "-")
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    shared_image = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "si", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "si"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }

    shared_image_gallery = {
      name       = substr(join("", compact([local.prefix_safe, "sig", local.suffix_safe])), 0, 80)
      dashes     = false
      slug       = "sig"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9.]+[a-zA-Z0-9]$"
    }

    signalr_service = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sgnlr", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "sgnlr"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }

    snapshots = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "snap", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "snap"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    sql_elasticpool = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sqlep", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "sqlep"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }

    sql_failover_group = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sqlfg", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "sqlfg"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    sql_firewall_rule = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sqlfw", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "sqlfw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:?\\+\\/]+[^<>*%:.?\\+\\/]$"
    }

    sql_server = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sql", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "sql"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    storage_account = {
      name       = substr(join("", compact([local.prefix_safe, "st", local.suffix_safe])), 0, 24)
      dashes     = false
      slug       = "st"
      min_length = 3
      max_length = 24
      scope      = "global"
      regex      = "^[a-z0-9]+$"
    }

    storage_blob = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "blob", local.suffix])), 0, 1024), "-")
      dashes     = true
      slug       = "blob"
      min_length = 1
      max_length = 1024
      scope      = "parent"
      regex      = "^[^\\s\\/$#&]+$"
    }

    storage_container = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "stct", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "stct"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+$"
    }

    storage_data_lake_gen2_filesystem = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "stdl", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "stdl"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    storage_queue = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "stq", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "stq"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    storage_share = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sts", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "sts"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    storage_share_directory = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "sts", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "sts"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    storage_table = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "stt", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "stt"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }

    stream_analytics_function_javascript_udf = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asafunc", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asafunc"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_job = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asa", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asa"
      min_length = 3
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_output_blob = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaoblob", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaoblob"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_output_eventhub = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaoeh", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaoeh"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_output_mssql = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaomssql", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaomssql"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_output_servicebus_queue = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaosbq", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaosbq"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_output_servicebus_topic = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaosbt", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaosbt"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_reference_input_blob = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asarblob", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asarblob"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_stream_input_blob = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaiblob", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaiblob"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_stream_input_eventhub = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaieh", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaieh"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    stream_analytics_stream_input_iothub = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "asaiiot", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "asaiiot"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    subnet = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "snet", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "snet"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    synapse_workspace = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "syn", local.suffix])), 0, 45), "-")
      dashes     = true
      slug       = "syn"
      min_length = 1
      max_length = 45
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }

    template_deployment = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "deploy", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "deploy"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-._\\(\\)]+$"
    }

    traffic_manager_profile = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "traf", local.suffix])), 0, 63), "-")
      dashes     = true
      slug       = "traf"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-.]+[a-zA-Z0-9_]$"
    }

    user_assigned_identity = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "uai", local.suffix])), 0, 128), "-")
      dashes     = true
      slug       = "uai"
      min_length = 3
      max_length = 128
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }

    virtual_machine = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vm", local.suffix])), 0, 15), "-")
      dashes     = true
      slug       = "vm"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

    virtual_machine_extension = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vmx", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "vmx"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    virtual_machine_scale_set = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vmss", local.suffix])), 0, 15), "-")
      dashes     = true
      slug       = "vmss"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

    virtual_machine_scale_set_extension = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vmssx", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "vmssx"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    virtual_network = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vnet", local.suffix])), 0, 64), "-")
      dashes     = true
      slug       = "vnet"
      min_length = 2
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    virtual_network_gateway = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vgw", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "vgw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    virtual_network_peering = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vpeer", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "vpeer"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    virtual_wan = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vwan", local.suffix])), 0, 80), "-")
      dashes     = true
      slug       = "vwan"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }

    windows_virtual_machine = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vm", local.suffix])), 0, 15), "-")
      dashes     = true
      slug       = "vm"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

    windows_virtual_machine_scale_set = {
      name       = trimsuffix(substr(join("-", compact([local.prefix, "vmss", local.suffix])), 0, 15), "-")
      dashes     = true
      slug       = "vmss"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

  }
  validation = {

    analysis_services_server = {
      valid_name = length(regexall(local.az.analysis_services_server.regex, local.az.analysis_services_server.name)) > 0 && length(local.az.analysis_services_server.name) > local.az.analysis_services_server.min_length
    }

    api_management = {
      valid_name = length(regexall(local.az.api_management.regex, local.az.api_management.name)) > 0 && length(local.az.api_management.name) > local.az.api_management.min_length
    }

    app_configuration = {
      valid_name = length(regexall(local.az.app_configuration.regex, local.az.app_configuration.name)) > 0 && length(local.az.app_configuration.name) > local.az.app_configuration.min_length
    }

    app_service = {
      valid_name = length(regexall(local.az.app_service.regex, local.az.app_service.name)) > 0 && length(local.az.app_service.name) > local.az.app_service.min_length
    }

    app_service_plan = {
      valid_name = length(regexall(local.az.app_service_plan.regex, local.az.app_service_plan.name)) > 0 && length(local.az.app_service_plan.name) > local.az.app_service_plan.min_length
    }

    application_gateway = {
      valid_name = length(regexall(local.az.application_gateway.regex, local.az.application_gateway.name)) > 0 && length(local.az.application_gateway.name) > local.az.application_gateway.min_length
    }

    application_insights = {
      valid_name = length(regexall(local.az.application_insights.regex, local.az.application_insights.name)) > 0 && length(local.az.application_insights.name) > local.az.application_insights.min_length
    }

    application_security_group = {
      valid_name = length(regexall(local.az.application_security_group.regex, local.az.application_security_group.name)) > 0 && length(local.az.application_security_group.name) > local.az.application_security_group.min_length
    }

    automation_account = {
      valid_name = length(regexall(local.az.automation_account.regex, local.az.automation_account.name)) > 0 && length(local.az.automation_account.name) > local.az.automation_account.min_length
    }

    automation_certificate = {
      valid_name = length(regexall(local.az.automation_certificate.regex, local.az.automation_certificate.name)) > 0 && length(local.az.automation_certificate.name) > local.az.automation_certificate.min_length
    }

    automation_credential = {
      valid_name = length(regexall(local.az.automation_credential.regex, local.az.automation_credential.name)) > 0 && length(local.az.automation_credential.name) > local.az.automation_credential.min_length
    }

    automation_runbook = {
      valid_name = length(regexall(local.az.automation_runbook.regex, local.az.automation_runbook.name)) > 0 && length(local.az.automation_runbook.name) > local.az.automation_runbook.min_length
    }

    automation_schedule = {
      valid_name = length(regexall(local.az.automation_schedule.regex, local.az.automation_schedule.name)) > 0 && length(local.az.automation_schedule.name) > local.az.automation_schedule.min_length
    }

    automation_variable = {
      valid_name = length(regexall(local.az.automation_variable.regex, local.az.automation_variable.name)) > 0 && length(local.az.automation_variable.name) > local.az.automation_variable.min_length
    }

    availability_set = {
      valid_name = length(regexall(local.az.availability_set.regex, local.az.availability_set.name)) > 0 && length(local.az.availability_set.name) > local.az.availability_set.min_length
    }

    bastion_host = {
      valid_name = length(regexall(local.az.bastion_host.regex, local.az.bastion_host.name)) > 0 && length(local.az.bastion_host.name) > local.az.bastion_host.min_length
    }

    batch_account = {
      valid_name = length(regexall(local.az.batch_account.regex, local.az.batch_account.name)) > 0 && length(local.az.batch_account.name) > local.az.batch_account.min_length
    }

    batch_application = {
      valid_name = length(regexall(local.az.batch_application.regex, local.az.batch_application.name)) > 0 && length(local.az.batch_application.name) > local.az.batch_application.min_length
    }

    batch_certificate = {
      valid_name = length(regexall(local.az.batch_certificate.regex, local.az.batch_certificate.name)) > 0 && length(local.az.batch_certificate.name) > local.az.batch_certificate.min_length
    }

    batch_pool = {
      valid_name = length(regexall(local.az.batch_pool.regex, local.az.batch_pool.name)) > 0 && length(local.az.batch_pool.name) > local.az.batch_pool.min_length
    }

    bot_channel_directline = {
      valid_name = length(regexall(local.az.bot_channel_directline.regex, local.az.bot_channel_directline.name)) > 0 && length(local.az.bot_channel_directline.name) > local.az.bot_channel_directline.min_length
    }

    bot_channel_email = {
      valid_name = length(regexall(local.az.bot_channel_email.regex, local.az.bot_channel_email.name)) > 0 && length(local.az.bot_channel_email.name) > local.az.bot_channel_email.min_length
    }

    bot_channel_ms_teams = {
      valid_name = length(regexall(local.az.bot_channel_ms_teams.regex, local.az.bot_channel_ms_teams.name)) > 0 && length(local.az.bot_channel_ms_teams.name) > local.az.bot_channel_ms_teams.min_length
    }

    bot_channel_slack = {
      valid_name = length(regexall(local.az.bot_channel_slack.regex, local.az.bot_channel_slack.name)) > 0 && length(local.az.bot_channel_slack.name) > local.az.bot_channel_slack.min_length
    }

    bot_channels_registration = {
      valid_name = length(regexall(local.az.bot_channels_registration.regex, local.az.bot_channels_registration.name)) > 0 && length(local.az.bot_channels_registration.name) > local.az.bot_channels_registration.min_length
    }

    bot_connection = {
      valid_name = length(regexall(local.az.bot_connection.regex, local.az.bot_connection.name)) > 0 && length(local.az.bot_connection.name) > local.az.bot_connection.min_length
    }

    bot_web_app = {
      valid_name = length(regexall(local.az.bot_web_app.regex, local.az.bot_web_app.name)) > 0 && length(local.az.bot_web_app.name) > local.az.bot_web_app.min_length
    }

    cdn_endpoint = {
      valid_name = length(regexall(local.az.cdn_endpoint.regex, local.az.cdn_endpoint.name)) > 0 && length(local.az.cdn_endpoint.name) > local.az.cdn_endpoint.min_length
    }

    cdn_profile = {
      valid_name = length(regexall(local.az.cdn_profile.regex, local.az.cdn_profile.name)) > 0 && length(local.az.cdn_profile.name) > local.az.cdn_profile.min_length
    }

    cognitive_account = {
      valid_name = length(regexall(local.az.cognitive_account.regex, local.az.cognitive_account.name)) > 0 && length(local.az.cognitive_account.name) > local.az.cognitive_account.min_length
    }

    container_group = {
      valid_name = length(regexall(local.az.container_group.regex, local.az.container_group.name)) > 0 && length(local.az.container_group.name) > local.az.container_group.min_length
    }

    container_registry = {
      valid_name = length(regexall(local.az.container_registry.regex, local.az.container_registry.name)) > 0 && length(local.az.container_registry.name) > local.az.container_registry.min_length
    }

    container_registry_webhook = {
      valid_name = length(regexall(local.az.container_registry_webhook.regex, local.az.container_registry_webhook.name)) > 0 && length(local.az.container_registry_webhook.name) > local.az.container_registry_webhook.min_length
    }

    cosmosdb_account = {
      valid_name = length(regexall(local.az.cosmosdb_account.regex, local.az.cosmosdb_account.name)) > 0 && length(local.az.cosmosdb_account.name) > local.az.cosmosdb_account.min_length
    }

    custom_provider = {
      valid_name = length(regexall(local.az.custom_provider.regex, local.az.custom_provider.name)) > 0 && length(local.az.custom_provider.name) > local.az.custom_provider.min_length
    }

    dashboard = {
      valid_name = length(regexall(local.az.dashboard.regex, local.az.dashboard.name)) > 0 && length(local.az.dashboard.name) > local.az.dashboard.min_length
    }

    data_factory = {
      valid_name = length(regexall(local.az.data_factory.regex, local.az.data_factory.name)) > 0 && length(local.az.data_factory.name) > local.az.data_factory.min_length
    }

    data_factory_dataset_mysql = {
      valid_name = length(regexall(local.az.data_factory_dataset_mysql.regex, local.az.data_factory_dataset_mysql.name)) > 0 && length(local.az.data_factory_dataset_mysql.name) > local.az.data_factory_dataset_mysql.min_length
    }

    data_factory_dataset_postgresql = {
      valid_name = length(regexall(local.az.data_factory_dataset_postgresql.regex, local.az.data_factory_dataset_postgresql.name)) > 0 && length(local.az.data_factory_dataset_postgresql.name) > local.az.data_factory_dataset_postgresql.min_length
    }

    data_factory_dataset_sql_server_table = {
      valid_name = length(regexall(local.az.data_factory_dataset_sql_server_table.regex, local.az.data_factory_dataset_sql_server_table.name)) > 0 && length(local.az.data_factory_dataset_sql_server_table.name) > local.az.data_factory_dataset_sql_server_table.min_length
    }

    data_factory_integration_runtime_managed = {
      valid_name = length(regexall(local.az.data_factory_integration_runtime_managed.regex, local.az.data_factory_integration_runtime_managed.name)) > 0 && length(local.az.data_factory_integration_runtime_managed.name) > local.az.data_factory_integration_runtime_managed.min_length
    }

    data_factory_linked_service_data_lake_storage_gen2 = {
      valid_name = length(regexall(local.az.data_factory_linked_service_data_lake_storage_gen2.regex, local.az.data_factory_linked_service_data_lake_storage_gen2.name)) > 0 && length(local.az.data_factory_linked_service_data_lake_storage_gen2.name) > local.az.data_factory_linked_service_data_lake_storage_gen2.min_length
    }

    data_factory_linked_service_key_vault = {
      valid_name = length(regexall(local.az.data_factory_linked_service_key_vault.regex, local.az.data_factory_linked_service_key_vault.name)) > 0 && length(local.az.data_factory_linked_service_key_vault.name) > local.az.data_factory_linked_service_key_vault.min_length
    }

    data_factory_linked_service_mysql = {
      valid_name = length(regexall(local.az.data_factory_linked_service_mysql.regex, local.az.data_factory_linked_service_mysql.name)) > 0 && length(local.az.data_factory_linked_service_mysql.name) > local.az.data_factory_linked_service_mysql.min_length
    }

    data_factory_linked_service_postgresql = {
      valid_name = length(regexall(local.az.data_factory_linked_service_postgresql.regex, local.az.data_factory_linked_service_postgresql.name)) > 0 && length(local.az.data_factory_linked_service_postgresql.name) > local.az.data_factory_linked_service_postgresql.min_length
    }

    data_factory_linked_service_sql_server = {
      valid_name = length(regexall(local.az.data_factory_linked_service_sql_server.regex, local.az.data_factory_linked_service_sql_server.name)) > 0 && length(local.az.data_factory_linked_service_sql_server.name) > local.az.data_factory_linked_service_sql_server.min_length
    }

    data_factory_pipeline = {
      valid_name = length(regexall(local.az.data_factory_pipeline.regex, local.az.data_factory_pipeline.name)) > 0 && length(local.az.data_factory_pipeline.name) > local.az.data_factory_pipeline.min_length
    }

    data_factory_trigger_schedule = {
      valid_name = length(regexall(local.az.data_factory_trigger_schedule.regex, local.az.data_factory_trigger_schedule.name)) > 0 && length(local.az.data_factory_trigger_schedule.name) > local.az.data_factory_trigger_schedule.min_length
    }

    data_lake_analytics_account = {
      valid_name = length(regexall(local.az.data_lake_analytics_account.regex, local.az.data_lake_analytics_account.name)) > 0 && length(local.az.data_lake_analytics_account.name) > local.az.data_lake_analytics_account.min_length
    }

    data_lake_analytics_firewall_rule = {
      valid_name = length(regexall(local.az.data_lake_analytics_firewall_rule.regex, local.az.data_lake_analytics_firewall_rule.name)) > 0 && length(local.az.data_lake_analytics_firewall_rule.name) > local.az.data_lake_analytics_firewall_rule.min_length
    }

    data_lake_store = {
      valid_name = length(regexall(local.az.data_lake_store.regex, local.az.data_lake_store.name)) > 0 && length(local.az.data_lake_store.name) > local.az.data_lake_store.min_length
    }

    data_lake_store_firewall_rule = {
      valid_name = length(regexall(local.az.data_lake_store_firewall_rule.regex, local.az.data_lake_store_firewall_rule.name)) > 0 && length(local.az.data_lake_store_firewall_rule.name) > local.az.data_lake_store_firewall_rule.min_length
    }

    database_migration_project = {
      valid_name = length(regexall(local.az.database_migration_project.regex, local.az.database_migration_project.name)) > 0 && length(local.az.database_migration_project.name) > local.az.database_migration_project.min_length
    }

    database_migration_service = {
      valid_name = length(regexall(local.az.database_migration_service.regex, local.az.database_migration_service.name)) > 0 && length(local.az.database_migration_service.name) > local.az.database_migration_service.min_length
    }

    databricks_cluster = {
      valid_name = length(regexall(local.az.databricks_cluster.regex, local.az.databricks_cluster.name)) > 0 && length(local.az.databricks_cluster.name) > local.az.databricks_cluster.min_length
    }

    databricks_high_concurrency_cluster = {
      valid_name = length(regexall(local.az.databricks_high_concurrency_cluster.regex, local.az.databricks_high_concurrency_cluster.name)) > 0 && length(local.az.databricks_high_concurrency_cluster.name) > local.az.databricks_high_concurrency_cluster.min_length
    }

    databricks_standard_cluster = {
      valid_name = length(regexall(local.az.databricks_standard_cluster.regex, local.az.databricks_standard_cluster.name)) > 0 && length(local.az.databricks_standard_cluster.name) > local.az.databricks_standard_cluster.min_length
    }

    databricks_workspace = {
      valid_name = length(regexall(local.az.databricks_workspace.regex, local.az.databricks_workspace.name)) > 0 && length(local.az.databricks_workspace.name) > local.az.databricks_workspace.min_length
    }

    dev_test_lab = {
      valid_name = length(regexall(local.az.dev_test_lab.regex, local.az.dev_test_lab.name)) > 0 && length(local.az.dev_test_lab.name) > local.az.dev_test_lab.min_length
    }

    dev_test_linux_virtual_machine = {
      valid_name = length(regexall(local.az.dev_test_linux_virtual_machine.regex, local.az.dev_test_linux_virtual_machine.name)) > 0 && length(local.az.dev_test_linux_virtual_machine.name) > local.az.dev_test_linux_virtual_machine.min_length
    }

    dev_test_windows_virtual_machine = {
      valid_name = length(regexall(local.az.dev_test_windows_virtual_machine.regex, local.az.dev_test_windows_virtual_machine.name)) > 0 && length(local.az.dev_test_windows_virtual_machine.name) > local.az.dev_test_windows_virtual_machine.min_length
    }

    disk_encryption_set = {
      valid_name = length(regexall(local.az.disk_encryption_set.regex, local.az.disk_encryption_set.name)) > 0 && length(local.az.disk_encryption_set.name) > local.az.disk_encryption_set.min_length
    }

    dns_a_record = {
      valid_name = length(regexall(local.az.dns_a_record.regex, local.az.dns_a_record.name)) > 0 && length(local.az.dns_a_record.name) > local.az.dns_a_record.min_length
    }

    dns_aaaa_record = {
      valid_name = length(regexall(local.az.dns_aaaa_record.regex, local.az.dns_aaaa_record.name)) > 0 && length(local.az.dns_aaaa_record.name) > local.az.dns_aaaa_record.min_length
    }

    dns_caa_record = {
      valid_name = length(regexall(local.az.dns_caa_record.regex, local.az.dns_caa_record.name)) > 0 && length(local.az.dns_caa_record.name) > local.az.dns_caa_record.min_length
    }

    dns_cname_record = {
      valid_name = length(regexall(local.az.dns_cname_record.regex, local.az.dns_cname_record.name)) > 0 && length(local.az.dns_cname_record.name) > local.az.dns_cname_record.min_length
    }

    dns_mx_record = {
      valid_name = length(regexall(local.az.dns_mx_record.regex, local.az.dns_mx_record.name)) > 0 && length(local.az.dns_mx_record.name) > local.az.dns_mx_record.min_length
    }

    dns_ns_record = {
      valid_name = length(regexall(local.az.dns_ns_record.regex, local.az.dns_ns_record.name)) > 0 && length(local.az.dns_ns_record.name) > local.az.dns_ns_record.min_length
    }

    dns_ptr_record = {
      valid_name = length(regexall(local.az.dns_ptr_record.regex, local.az.dns_ptr_record.name)) > 0 && length(local.az.dns_ptr_record.name) > local.az.dns_ptr_record.min_length
    }

    dns_txt_record = {
      valid_name = length(regexall(local.az.dns_txt_record.regex, local.az.dns_txt_record.name)) > 0 && length(local.az.dns_txt_record.name) > local.az.dns_txt_record.min_length
    }

    dns_zone = {
      valid_name = length(regexall(local.az.dns_zone.regex, local.az.dns_zone.name)) > 0 && length(local.az.dns_zone.name) > local.az.dns_zone.min_length
    }

    eventgrid_domain = {
      valid_name = length(regexall(local.az.eventgrid_domain.regex, local.az.eventgrid_domain.name)) > 0 && length(local.az.eventgrid_domain.name) > local.az.eventgrid_domain.min_length
    }

    eventgrid_domain_topic = {
      valid_name = length(regexall(local.az.eventgrid_domain_topic.regex, local.az.eventgrid_domain_topic.name)) > 0 && length(local.az.eventgrid_domain_topic.name) > local.az.eventgrid_domain_topic.min_length
    }

    eventgrid_event_subscription = {
      valid_name = length(regexall(local.az.eventgrid_event_subscription.regex, local.az.eventgrid_event_subscription.name)) > 0 && length(local.az.eventgrid_event_subscription.name) > local.az.eventgrid_event_subscription.min_length
    }

    eventgrid_topic = {
      valid_name = length(regexall(local.az.eventgrid_topic.regex, local.az.eventgrid_topic.name)) > 0 && length(local.az.eventgrid_topic.name) > local.az.eventgrid_topic.min_length
    }

    eventhub = {
      valid_name = length(regexall(local.az.eventhub.regex, local.az.eventhub.name)) > 0 && length(local.az.eventhub.name) > local.az.eventhub.min_length
    }

    eventhub_authorization_rule = {
      valid_name = length(regexall(local.az.eventhub_authorization_rule.regex, local.az.eventhub_authorization_rule.name)) > 0 && length(local.az.eventhub_authorization_rule.name) > local.az.eventhub_authorization_rule.min_length
    }

    eventhub_consumer_group = {
      valid_name = length(regexall(local.az.eventhub_consumer_group.regex, local.az.eventhub_consumer_group.name)) > 0 && length(local.az.eventhub_consumer_group.name) > local.az.eventhub_consumer_group.min_length
    }

    eventhub_namespace = {
      valid_name = length(regexall(local.az.eventhub_namespace.regex, local.az.eventhub_namespace.name)) > 0 && length(local.az.eventhub_namespace.name) > local.az.eventhub_namespace.min_length
    }

    eventhub_namespace_authorization_rule = {
      valid_name = length(regexall(local.az.eventhub_namespace_authorization_rule.regex, local.az.eventhub_namespace_authorization_rule.name)) > 0 && length(local.az.eventhub_namespace_authorization_rule.name) > local.az.eventhub_namespace_authorization_rule.min_length
    }

    eventhub_namespace_disaster_recovery_config = {
      valid_name = length(regexall(local.az.eventhub_namespace_disaster_recovery_config.regex, local.az.eventhub_namespace_disaster_recovery_config.name)) > 0 && length(local.az.eventhub_namespace_disaster_recovery_config.name) > local.az.eventhub_namespace_disaster_recovery_config.min_length
    }

    express_route_circuit = {
      valid_name = length(regexall(local.az.express_route_circuit.regex, local.az.express_route_circuit.name)) > 0 && length(local.az.express_route_circuit.name) > local.az.express_route_circuit.min_length
    }

    express_route_gateway = {
      valid_name = length(regexall(local.az.express_route_gateway.regex, local.az.express_route_gateway.name)) > 0 && length(local.az.express_route_gateway.name) > local.az.express_route_gateway.min_length
    }

    firewall = {
      valid_name = length(regexall(local.az.firewall.regex, local.az.firewall.name)) > 0 && length(local.az.firewall.name) > local.az.firewall.min_length
    }

    firewall_application_rule_collection = {
      valid_name = length(regexall(local.az.firewall_application_rule_collection.regex, local.az.firewall_application_rule_collection.name)) > 0 && length(local.az.firewall_application_rule_collection.name) > local.az.firewall_application_rule_collection.min_length
    }

    firewall_ip_configuration = {
      valid_name = length(regexall(local.az.firewall_ip_configuration.regex, local.az.firewall_ip_configuration.name)) > 0 && length(local.az.firewall_ip_configuration.name) > local.az.firewall_ip_configuration.min_length
    }

    firewall_nat_rule_collection = {
      valid_name = length(regexall(local.az.firewall_nat_rule_collection.regex, local.az.firewall_nat_rule_collection.name)) > 0 && length(local.az.firewall_nat_rule_collection.name) > local.az.firewall_nat_rule_collection.min_length
    }

    firewall_network_rule_collection = {
      valid_name = length(regexall(local.az.firewall_network_rule_collection.regex, local.az.firewall_network_rule_collection.name)) > 0 && length(local.az.firewall_network_rule_collection.name) > local.az.firewall_network_rule_collection.min_length
    }

    frontdoor = {
      valid_name = length(regexall(local.az.frontdoor.regex, local.az.frontdoor.name)) > 0 && length(local.az.frontdoor.name) > local.az.frontdoor.min_length
    }

    frontdoor_firewall_policy = {
      valid_name = length(regexall(local.az.frontdoor_firewall_policy.regex, local.az.frontdoor_firewall_policy.name)) > 0 && length(local.az.frontdoor_firewall_policy.name) > local.az.frontdoor_firewall_policy.min_length
    }

    function_app = {
      valid_name = length(regexall(local.az.function_app.regex, local.az.function_app.name)) > 0 && length(local.az.function_app.name) > local.az.function_app.min_length
    }

    hdinsight_hadoop_cluster = {
      valid_name = length(regexall(local.az.hdinsight_hadoop_cluster.regex, local.az.hdinsight_hadoop_cluster.name)) > 0 && length(local.az.hdinsight_hadoop_cluster.name) > local.az.hdinsight_hadoop_cluster.min_length
    }

    hdinsight_hbase_cluster = {
      valid_name = length(regexall(local.az.hdinsight_hbase_cluster.regex, local.az.hdinsight_hbase_cluster.name)) > 0 && length(local.az.hdinsight_hbase_cluster.name) > local.az.hdinsight_hbase_cluster.min_length
    }

    hdinsight_interactive_query_cluster = {
      valid_name = length(regexall(local.az.hdinsight_interactive_query_cluster.regex, local.az.hdinsight_interactive_query_cluster.name)) > 0 && length(local.az.hdinsight_interactive_query_cluster.name) > local.az.hdinsight_interactive_query_cluster.min_length
    }

    hdinsight_kafka_cluster = {
      valid_name = length(regexall(local.az.hdinsight_kafka_cluster.regex, local.az.hdinsight_kafka_cluster.name)) > 0 && length(local.az.hdinsight_kafka_cluster.name) > local.az.hdinsight_kafka_cluster.min_length
    }

    hdinsight_ml_services_cluster = {
      valid_name = length(regexall(local.az.hdinsight_ml_services_cluster.regex, local.az.hdinsight_ml_services_cluster.name)) > 0 && length(local.az.hdinsight_ml_services_cluster.name) > local.az.hdinsight_ml_services_cluster.min_length
    }

    hdinsight_rserver_cluster = {
      valid_name = length(regexall(local.az.hdinsight_rserver_cluster.regex, local.az.hdinsight_rserver_cluster.name)) > 0 && length(local.az.hdinsight_rserver_cluster.name) > local.az.hdinsight_rserver_cluster.min_length
    }

    hdinsight_spark_cluster = {
      valid_name = length(regexall(local.az.hdinsight_spark_cluster.regex, local.az.hdinsight_spark_cluster.name)) > 0 && length(local.az.hdinsight_spark_cluster.name) > local.az.hdinsight_spark_cluster.min_length
    }

    hdinsight_storm_cluster = {
      valid_name = length(regexall(local.az.hdinsight_storm_cluster.regex, local.az.hdinsight_storm_cluster.name)) > 0 && length(local.az.hdinsight_storm_cluster.name) > local.az.hdinsight_storm_cluster.min_length
    }

    image = {
      valid_name = length(regexall(local.az.image.regex, local.az.image.name)) > 0 && length(local.az.image.name) > local.az.image.min_length
    }

    iotcentral_application = {
      valid_name = length(regexall(local.az.iotcentral_application.regex, local.az.iotcentral_application.name)) > 0 && length(local.az.iotcentral_application.name) > local.az.iotcentral_application.min_length
    }

    iothub = {
      valid_name = length(regexall(local.az.iothub.regex, local.az.iothub.name)) > 0 && length(local.az.iothub.name) > local.az.iothub.min_length
    }

    iothub_consumer_group = {
      valid_name = length(regexall(local.az.iothub_consumer_group.regex, local.az.iothub_consumer_group.name)) > 0 && length(local.az.iothub_consumer_group.name) > local.az.iothub_consumer_group.min_length
    }

    iothub_dps = {
      valid_name = length(regexall(local.az.iothub_dps.regex, local.az.iothub_dps.name)) > 0 && length(local.az.iothub_dps.name) > local.az.iothub_dps.min_length
    }

    iothub_dps_certificate = {
      valid_name = length(regexall(local.az.iothub_dps_certificate.regex, local.az.iothub_dps_certificate.name)) > 0 && length(local.az.iothub_dps_certificate.name) > local.az.iothub_dps_certificate.min_length
    }

    key_vault = {
      valid_name = length(regexall(local.az.key_vault.regex, local.az.key_vault.name)) > 0 && length(local.az.key_vault.name) > local.az.key_vault.min_length
    }

    key_vault_certificate = {
      valid_name = length(regexall(local.az.key_vault_certificate.regex, local.az.key_vault_certificate.name)) > 0 && length(local.az.key_vault_certificate.name) > local.az.key_vault_certificate.min_length
    }

    key_vault_key = {
      valid_name = length(regexall(local.az.key_vault_key.regex, local.az.key_vault_key.name)) > 0 && length(local.az.key_vault_key.name) > local.az.key_vault_key.min_length
    }

    key_vault_secret = {
      valid_name = length(regexall(local.az.key_vault_secret.regex, local.az.key_vault_secret.name)) > 0 && length(local.az.key_vault_secret.name) > local.az.key_vault_secret.min_length
    }

    kubernetes_cluster = {
      valid_name = length(regexall(local.az.kubernetes_cluster.regex, local.az.kubernetes_cluster.name)) > 0 && length(local.az.kubernetes_cluster.name) > local.az.kubernetes_cluster.min_length
    }

    kusto_cluster = {
      valid_name = length(regexall(local.az.kusto_cluster.regex, local.az.kusto_cluster.name)) > 0 && length(local.az.kusto_cluster.name) > local.az.kusto_cluster.min_length
    }

    kusto_database = {
      valid_name = length(regexall(local.az.kusto_database.regex, local.az.kusto_database.name)) > 0 && length(local.az.kusto_database.name) > local.az.kusto_database.min_length
    }

    kusto_eventhub_data_connection = {
      valid_name = length(regexall(local.az.kusto_eventhub_data_connection.regex, local.az.kusto_eventhub_data_connection.name)) > 0 && length(local.az.kusto_eventhub_data_connection.name) > local.az.kusto_eventhub_data_connection.min_length
    }

    lb = {
      valid_name = length(regexall(local.az.lb.regex, local.az.lb.name)) > 0 && length(local.az.lb.name) > local.az.lb.min_length
    }

    lb_nat_rule = {
      valid_name = length(regexall(local.az.lb_nat_rule.regex, local.az.lb_nat_rule.name)) > 0 && length(local.az.lb_nat_rule.name) > local.az.lb_nat_rule.min_length
    }

    linux_virtual_machine = {
      valid_name = length(regexall(local.az.linux_virtual_machine.regex, local.az.linux_virtual_machine.name)) > 0 && length(local.az.linux_virtual_machine.name) > local.az.linux_virtual_machine.min_length
    }

    linux_virtual_machine_scale_set = {
      valid_name = length(regexall(local.az.linux_virtual_machine_scale_set.regex, local.az.linux_virtual_machine_scale_set.name)) > 0 && length(local.az.linux_virtual_machine_scale_set.name) > local.az.linux_virtual_machine_scale_set.min_length
    }

    local_network_gateway = {
      valid_name = length(regexall(local.az.local_network_gateway.regex, local.az.local_network_gateway.name)) > 0 && length(local.az.local_network_gateway.name) > local.az.local_network_gateway.min_length
    }

    log_analytics_workspace = {
      valid_name = length(regexall(local.az.log_analytics_workspace.regex, local.az.log_analytics_workspace.name)) > 0 && length(local.az.log_analytics_workspace.name) > local.az.log_analytics_workspace.min_length
    }

    machine_learning_workspace = {
      valid_name = length(regexall(local.az.machine_learning_workspace.regex, local.az.machine_learning_workspace.name)) > 0 && length(local.az.machine_learning_workspace.name) > local.az.machine_learning_workspace.min_length
    }

    managed_disk = {
      valid_name = length(regexall(local.az.managed_disk.regex, local.az.managed_disk.name)) > 0 && length(local.az.managed_disk.name) > local.az.managed_disk.min_length
    }

    maps_account = {
      valid_name = length(regexall(local.az.maps_account.regex, local.az.maps_account.name)) > 0 && length(local.az.maps_account.name) > local.az.maps_account.min_length
    }

    mariadb_database = {
      valid_name = length(regexall(local.az.mariadb_database.regex, local.az.mariadb_database.name)) > 0 && length(local.az.mariadb_database.name) > local.az.mariadb_database.min_length
    }

    mariadb_firewall_rule = {
      valid_name = length(regexall(local.az.mariadb_firewall_rule.regex, local.az.mariadb_firewall_rule.name)) > 0 && length(local.az.mariadb_firewall_rule.name) > local.az.mariadb_firewall_rule.min_length
    }

    mariadb_server = {
      valid_name = length(regexall(local.az.mariadb_server.regex, local.az.mariadb_server.name)) > 0 && length(local.az.mariadb_server.name) > local.az.mariadb_server.min_length
    }

    mariadb_virtual_network_rule = {
      valid_name = length(regexall(local.az.mariadb_virtual_network_rule.regex, local.az.mariadb_virtual_network_rule.name)) > 0 && length(local.az.mariadb_virtual_network_rule.name) > local.az.mariadb_virtual_network_rule.min_length
    }

    mssql_database = {
      valid_name = length(regexall(local.az.mssql_database.regex, local.az.mssql_database.name)) > 0 && length(local.az.mssql_database.name) > local.az.mssql_database.min_length
    }

    mssql_elasticpool = {
      valid_name = length(regexall(local.az.mssql_elasticpool.regex, local.az.mssql_elasticpool.name)) > 0 && length(local.az.mssql_elasticpool.name) > local.az.mssql_elasticpool.min_length
    }

    mssql_server = {
      valid_name = length(regexall(local.az.mssql_server.regex, local.az.mssql_server.name)) > 0 && length(local.az.mssql_server.name) > local.az.mssql_server.min_length
    }

    mysql_database = {
      valid_name = length(regexall(local.az.mysql_database.regex, local.az.mysql_database.name)) > 0 && length(local.az.mysql_database.name) > local.az.mysql_database.min_length
    }

    mysql_firewall_rule = {
      valid_name = length(regexall(local.az.mysql_firewall_rule.regex, local.az.mysql_firewall_rule.name)) > 0 && length(local.az.mysql_firewall_rule.name) > local.az.mysql_firewall_rule.min_length
    }

    mysql_server = {
      valid_name = length(regexall(local.az.mysql_server.regex, local.az.mysql_server.name)) > 0 && length(local.az.mysql_server.name) > local.az.mysql_server.min_length
    }

    mysql_virtual_network_rule = {
      valid_name = length(regexall(local.az.mysql_virtual_network_rule.regex, local.az.mysql_virtual_network_rule.name)) > 0 && length(local.az.mysql_virtual_network_rule.name) > local.az.mysql_virtual_network_rule.min_length
    }

    network_ddos_protection_plan = {
      valid_name = length(regexall(local.az.network_ddos_protection_plan.regex, local.az.network_ddos_protection_plan.name)) > 0 && length(local.az.network_ddos_protection_plan.name) > local.az.network_ddos_protection_plan.min_length
    }

    network_interface = {
      valid_name = length(regexall(local.az.network_interface.regex, local.az.network_interface.name)) > 0 && length(local.az.network_interface.name) > local.az.network_interface.min_length
    }

    network_security_group = {
      valid_name = length(regexall(local.az.network_security_group.regex, local.az.network_security_group.name)) > 0 && length(local.az.network_security_group.name) > local.az.network_security_group.min_length
    }

    network_security_group_rule = {
      valid_name = length(regexall(local.az.network_security_group_rule.regex, local.az.network_security_group_rule.name)) > 0 && length(local.az.network_security_group_rule.name) > local.az.network_security_group_rule.min_length
    }

    network_security_rule = {
      valid_name = length(regexall(local.az.network_security_rule.regex, local.az.network_security_rule.name)) > 0 && length(local.az.network_security_rule.name) > local.az.network_security_rule.min_length
    }

    network_watcher = {
      valid_name = length(regexall(local.az.network_watcher.regex, local.az.network_watcher.name)) > 0 && length(local.az.network_watcher.name) > local.az.network_watcher.min_length
    }

    notification_hub = {
      valid_name = length(regexall(local.az.notification_hub.regex, local.az.notification_hub.name)) > 0 && length(local.az.notification_hub.name) > local.az.notification_hub.min_length
    }

    notification_hub_authorization_rule = {
      valid_name = length(regexall(local.az.notification_hub_authorization_rule.regex, local.az.notification_hub_authorization_rule.name)) > 0 && length(local.az.notification_hub_authorization_rule.name) > local.az.notification_hub_authorization_rule.min_length
    }

    notification_hub_namespace = {
      valid_name = length(regexall(local.az.notification_hub_namespace.regex, local.az.notification_hub_namespace.name)) > 0 && length(local.az.notification_hub_namespace.name) > local.az.notification_hub_namespace.min_length
    }

    point_to_site_vpn_gateway = {
      valid_name = length(regexall(local.az.point_to_site_vpn_gateway.regex, local.az.point_to_site_vpn_gateway.name)) > 0 && length(local.az.point_to_site_vpn_gateway.name) > local.az.point_to_site_vpn_gateway.min_length
    }

    postgresql_database = {
      valid_name = length(regexall(local.az.postgresql_database.regex, local.az.postgresql_database.name)) > 0 && length(local.az.postgresql_database.name) > local.az.postgresql_database.min_length
    }

    postgresql_firewall_rule = {
      valid_name = length(regexall(local.az.postgresql_firewall_rule.regex, local.az.postgresql_firewall_rule.name)) > 0 && length(local.az.postgresql_firewall_rule.name) > local.az.postgresql_firewall_rule.min_length
    }

    postgresql_server = {
      valid_name = length(regexall(local.az.postgresql_server.regex, local.az.postgresql_server.name)) > 0 && length(local.az.postgresql_server.name) > local.az.postgresql_server.min_length
    }

    postgresql_virtual_network_rule = {
      valid_name = length(regexall(local.az.postgresql_virtual_network_rule.regex, local.az.postgresql_virtual_network_rule.name)) > 0 && length(local.az.postgresql_virtual_network_rule.name) > local.az.postgresql_virtual_network_rule.min_length
    }

    powerbi_embedded = {
      valid_name = length(regexall(local.az.powerbi_embedded.regex, local.az.powerbi_embedded.name)) > 0 && length(local.az.powerbi_embedded.name) > local.az.powerbi_embedded.min_length
    }

    private_dns_a_record = {
      valid_name = length(regexall(local.az.private_dns_a_record.regex, local.az.private_dns_a_record.name)) > 0 && length(local.az.private_dns_a_record.name) > local.az.private_dns_a_record.min_length
    }

    private_dns_aaaa_record = {
      valid_name = length(regexall(local.az.private_dns_aaaa_record.regex, local.az.private_dns_aaaa_record.name)) > 0 && length(local.az.private_dns_aaaa_record.name) > local.az.private_dns_aaaa_record.min_length
    }

    private_dns_cname_record = {
      valid_name = length(regexall(local.az.private_dns_cname_record.regex, local.az.private_dns_cname_record.name)) > 0 && length(local.az.private_dns_cname_record.name) > local.az.private_dns_cname_record.min_length
    }

    private_dns_mx_record = {
      valid_name = length(regexall(local.az.private_dns_mx_record.regex, local.az.private_dns_mx_record.name)) > 0 && length(local.az.private_dns_mx_record.name) > local.az.private_dns_mx_record.min_length
    }

    private_dns_ptr_record = {
      valid_name = length(regexall(local.az.private_dns_ptr_record.regex, local.az.private_dns_ptr_record.name)) > 0 && length(local.az.private_dns_ptr_record.name) > local.az.private_dns_ptr_record.min_length
    }

    private_dns_srv_record = {
      valid_name = length(regexall(local.az.private_dns_srv_record.regex, local.az.private_dns_srv_record.name)) > 0 && length(local.az.private_dns_srv_record.name) > local.az.private_dns_srv_record.min_length
    }

    private_dns_txt_record = {
      valid_name = length(regexall(local.az.private_dns_txt_record.regex, local.az.private_dns_txt_record.name)) > 0 && length(local.az.private_dns_txt_record.name) > local.az.private_dns_txt_record.min_length
    }

    private_dns_zone = {
      valid_name = length(regexall(local.az.private_dns_zone.regex, local.az.private_dns_zone.name)) > 0 && length(local.az.private_dns_zone.name) > local.az.private_dns_zone.min_length
    }

    private_dns_zone_group = {
      valid_name = length(regexall(local.az.private_dns_zone_group.regex, local.az.private_dns_zone_group.name)) > 0 && length(local.az.private_dns_zone_group.name) > local.az.private_dns_zone_group.min_length
    }

    private_endpoint = {
      valid_name = length(regexall(local.az.private_endpoint.regex, local.az.private_endpoint.name)) > 0 && length(local.az.private_endpoint.name) > local.az.private_endpoint.min_length
    }

    private_link_service = {
      valid_name = length(regexall(local.az.private_link_service.regex, local.az.private_link_service.name)) > 0 && length(local.az.private_link_service.name) > local.az.private_link_service.min_length
    }

    private_service_connection = {
      valid_name = length(regexall(local.az.private_service_connection.regex, local.az.private_service_connection.name)) > 0 && length(local.az.private_service_connection.name) > local.az.private_service_connection.min_length
    }

    proximity_placement_group = {
      valid_name = length(regexall(local.az.proximity_placement_group.regex, local.az.proximity_placement_group.name)) > 0 && length(local.az.proximity_placement_group.name) > local.az.proximity_placement_group.min_length
    }

    public_ip = {
      valid_name = length(regexall(local.az.public_ip.regex, local.az.public_ip.name)) > 0 && length(local.az.public_ip.name) > local.az.public_ip.min_length
    }

    public_ip_prefix = {
      valid_name = length(regexall(local.az.public_ip_prefix.regex, local.az.public_ip_prefix.name)) > 0 && length(local.az.public_ip_prefix.name) > local.az.public_ip_prefix.min_length
    }

    recovery_services_vault = {
      valid_name = length(regexall(local.az.recovery_services_vault.regex, local.az.recovery_services_vault.name)) > 0 && length(local.az.recovery_services_vault.name) > local.az.recovery_services_vault.min_length
    }

    redis_cache = {
      valid_name = length(regexall(local.az.redis_cache.regex, local.az.redis_cache.name)) > 0 && length(local.az.redis_cache.name) > local.az.redis_cache.min_length
    }

    redis_firewall_rule = {
      valid_name = length(regexall(local.az.redis_firewall_rule.regex, local.az.redis_firewall_rule.name)) > 0 && length(local.az.redis_firewall_rule.name) > local.az.redis_firewall_rule.min_length
    }

    relay_hybrid_connection = {
      valid_name = length(regexall(local.az.relay_hybrid_connection.regex, local.az.relay_hybrid_connection.name)) > 0 && length(local.az.relay_hybrid_connection.name) > local.az.relay_hybrid_connection.min_length
    }

    relay_namespace = {
      valid_name = length(regexall(local.az.relay_namespace.regex, local.az.relay_namespace.name)) > 0 && length(local.az.relay_namespace.name) > local.az.relay_namespace.min_length
    }

    resource_group = {
      valid_name = length(regexall(local.az.resource_group.regex, local.az.resource_group.name)) > 0 && length(local.az.resource_group.name) > local.az.resource_group.min_length
    }

    role_assignment = {
      valid_name = length(regexall(local.az.role_assignment.regex, local.az.role_assignment.name)) > 0 && length(local.az.role_assignment.name) > local.az.role_assignment.min_length
    }

    role_definition = {
      valid_name = length(regexall(local.az.role_definition.regex, local.az.role_definition.name)) > 0 && length(local.az.role_definition.name) > local.az.role_definition.min_length
    }

    route = {
      valid_name = length(regexall(local.az.route.regex, local.az.route.name)) > 0 && length(local.az.route.name) > local.az.route.min_length
    }

    route_table = {
      valid_name = length(regexall(local.az.route_table.regex, local.az.route_table.name)) > 0 && length(local.az.route_table.name) > local.az.route_table.min_length
    }

    service_fabric_cluster = {
      valid_name = length(regexall(local.az.service_fabric_cluster.regex, local.az.service_fabric_cluster.name)) > 0 && length(local.az.service_fabric_cluster.name) > local.az.service_fabric_cluster.min_length
    }

    servicebus_namespace = {
      valid_name = length(regexall(local.az.servicebus_namespace.regex, local.az.servicebus_namespace.name)) > 0 && length(local.az.servicebus_namespace.name) > local.az.servicebus_namespace.min_length
    }

    servicebus_namespace_authorization_rule = {
      valid_name = length(regexall(local.az.servicebus_namespace_authorization_rule.regex, local.az.servicebus_namespace_authorization_rule.name)) > 0 && length(local.az.servicebus_namespace_authorization_rule.name) > local.az.servicebus_namespace_authorization_rule.min_length
    }

    servicebus_queue = {
      valid_name = length(regexall(local.az.servicebus_queue.regex, local.az.servicebus_queue.name)) > 0 && length(local.az.servicebus_queue.name) > local.az.servicebus_queue.min_length
    }

    servicebus_queue_authorization_rule = {
      valid_name = length(regexall(local.az.servicebus_queue_authorization_rule.regex, local.az.servicebus_queue_authorization_rule.name)) > 0 && length(local.az.servicebus_queue_authorization_rule.name) > local.az.servicebus_queue_authorization_rule.min_length
    }

    servicebus_subscription = {
      valid_name = length(regexall(local.az.servicebus_subscription.regex, local.az.servicebus_subscription.name)) > 0 && length(local.az.servicebus_subscription.name) > local.az.servicebus_subscription.min_length
    }

    servicebus_subscription_rule = {
      valid_name = length(regexall(local.az.servicebus_subscription_rule.regex, local.az.servicebus_subscription_rule.name)) > 0 && length(local.az.servicebus_subscription_rule.name) > local.az.servicebus_subscription_rule.min_length
    }

    servicebus_topic = {
      valid_name = length(regexall(local.az.servicebus_topic.regex, local.az.servicebus_topic.name)) > 0 && length(local.az.servicebus_topic.name) > local.az.servicebus_topic.min_length
    }

    servicebus_topic_authorization_rule = {
      valid_name = length(regexall(local.az.servicebus_topic_authorization_rule.regex, local.az.servicebus_topic_authorization_rule.name)) > 0 && length(local.az.servicebus_topic_authorization_rule.name) > local.az.servicebus_topic_authorization_rule.min_length
    }

    shared_image = {
      valid_name = length(regexall(local.az.shared_image.regex, local.az.shared_image.name)) > 0 && length(local.az.shared_image.name) > local.az.shared_image.min_length
    }

    shared_image_gallery = {
      valid_name = length(regexall(local.az.shared_image_gallery.regex, local.az.shared_image_gallery.name)) > 0 && length(local.az.shared_image_gallery.name) > local.az.shared_image_gallery.min_length
    }

    signalr_service = {
      valid_name = length(regexall(local.az.signalr_service.regex, local.az.signalr_service.name)) > 0 && length(local.az.signalr_service.name) > local.az.signalr_service.min_length
    }

    snapshots = {
      valid_name = length(regexall(local.az.snapshots.regex, local.az.snapshots.name)) > 0 && length(local.az.snapshots.name) > local.az.snapshots.min_length
    }

    sql_elasticpool = {
      valid_name = length(regexall(local.az.sql_elasticpool.regex, local.az.sql_elasticpool.name)) > 0 && length(local.az.sql_elasticpool.name) > local.az.sql_elasticpool.min_length
    }

    sql_failover_group = {
      valid_name = length(regexall(local.az.sql_failover_group.regex, local.az.sql_failover_group.name)) > 0 && length(local.az.sql_failover_group.name) > local.az.sql_failover_group.min_length
    }

    sql_firewall_rule = {
      valid_name = length(regexall(local.az.sql_firewall_rule.regex, local.az.sql_firewall_rule.name)) > 0 && length(local.az.sql_firewall_rule.name) > local.az.sql_firewall_rule.min_length
    }

    sql_server = {
      valid_name = length(regexall(local.az.sql_server.regex, local.az.sql_server.name)) > 0 && length(local.az.sql_server.name) > local.az.sql_server.min_length
    }

    storage_account = {
      valid_name = length(regexall(local.az.storage_account.regex, local.az.storage_account.name)) > 0 && length(local.az.storage_account.name) > local.az.storage_account.min_length
    }

    storage_blob = {
      valid_name = length(regexall(local.az.storage_blob.regex, local.az.storage_blob.name)) > 0 && length(local.az.storage_blob.name) > local.az.storage_blob.min_length
    }

    storage_container = {
      valid_name = length(regexall(local.az.storage_container.regex, local.az.storage_container.name)) > 0 && length(local.az.storage_container.name) > local.az.storage_container.min_length
    }

    storage_data_lake_gen2_filesystem = {
      valid_name = length(regexall(local.az.storage_data_lake_gen2_filesystem.regex, local.az.storage_data_lake_gen2_filesystem.name)) > 0 && length(local.az.storage_data_lake_gen2_filesystem.name) > local.az.storage_data_lake_gen2_filesystem.min_length
    }

    storage_queue = {
      valid_name = length(regexall(local.az.storage_queue.regex, local.az.storage_queue.name)) > 0 && length(local.az.storage_queue.name) > local.az.storage_queue.min_length
    }

    storage_share = {
      valid_name = length(regexall(local.az.storage_share.regex, local.az.storage_share.name)) > 0 && length(local.az.storage_share.name) > local.az.storage_share.min_length
    }

    storage_share_directory = {
      valid_name = length(regexall(local.az.storage_share_directory.regex, local.az.storage_share_directory.name)) > 0 && length(local.az.storage_share_directory.name) > local.az.storage_share_directory.min_length
    }

    storage_table = {
      valid_name = length(regexall(local.az.storage_table.regex, local.az.storage_table.name)) > 0 && length(local.az.storage_table.name) > local.az.storage_table.min_length
    }

    stream_analytics_function_javascript_udf = {
      valid_name = length(regexall(local.az.stream_analytics_function_javascript_udf.regex, local.az.stream_analytics_function_javascript_udf.name)) > 0 && length(local.az.stream_analytics_function_javascript_udf.name) > local.az.stream_analytics_function_javascript_udf.min_length
    }

    stream_analytics_job = {
      valid_name = length(regexall(local.az.stream_analytics_job.regex, local.az.stream_analytics_job.name)) > 0 && length(local.az.stream_analytics_job.name) > local.az.stream_analytics_job.min_length
    }

    stream_analytics_output_blob = {
      valid_name = length(regexall(local.az.stream_analytics_output_blob.regex, local.az.stream_analytics_output_blob.name)) > 0 && length(local.az.stream_analytics_output_blob.name) > local.az.stream_analytics_output_blob.min_length
    }

    stream_analytics_output_eventhub = {
      valid_name = length(regexall(local.az.stream_analytics_output_eventhub.regex, local.az.stream_analytics_output_eventhub.name)) > 0 && length(local.az.stream_analytics_output_eventhub.name) > local.az.stream_analytics_output_eventhub.min_length
    }

    stream_analytics_output_mssql = {
      valid_name = length(regexall(local.az.stream_analytics_output_mssql.regex, local.az.stream_analytics_output_mssql.name)) > 0 && length(local.az.stream_analytics_output_mssql.name) > local.az.stream_analytics_output_mssql.min_length
    }

    stream_analytics_output_servicebus_queue = {
      valid_name = length(regexall(local.az.stream_analytics_output_servicebus_queue.regex, local.az.stream_analytics_output_servicebus_queue.name)) > 0 && length(local.az.stream_analytics_output_servicebus_queue.name) > local.az.stream_analytics_output_servicebus_queue.min_length
    }

    stream_analytics_output_servicebus_topic = {
      valid_name = length(regexall(local.az.stream_analytics_output_servicebus_topic.regex, local.az.stream_analytics_output_servicebus_topic.name)) > 0 && length(local.az.stream_analytics_output_servicebus_topic.name) > local.az.stream_analytics_output_servicebus_topic.min_length
    }

    stream_analytics_reference_input_blob = {
      valid_name = length(regexall(local.az.stream_analytics_reference_input_blob.regex, local.az.stream_analytics_reference_input_blob.name)) > 0 && length(local.az.stream_analytics_reference_input_blob.name) > local.az.stream_analytics_reference_input_blob.min_length
    }

    stream_analytics_stream_input_blob = {
      valid_name = length(regexall(local.az.stream_analytics_stream_input_blob.regex, local.az.stream_analytics_stream_input_blob.name)) > 0 && length(local.az.stream_analytics_stream_input_blob.name) > local.az.stream_analytics_stream_input_blob.min_length
    }

    stream_analytics_stream_input_eventhub = {
      valid_name = length(regexall(local.az.stream_analytics_stream_input_eventhub.regex, local.az.stream_analytics_stream_input_eventhub.name)) > 0 && length(local.az.stream_analytics_stream_input_eventhub.name) > local.az.stream_analytics_stream_input_eventhub.min_length
    }

    stream_analytics_stream_input_iothub = {
      valid_name = length(regexall(local.az.stream_analytics_stream_input_iothub.regex, local.az.stream_analytics_stream_input_iothub.name)) > 0 && length(local.az.stream_analytics_stream_input_iothub.name) > local.az.stream_analytics_stream_input_iothub.min_length
    }

    subnet = {
      valid_name = length(regexall(local.az.subnet.regex, local.az.subnet.name)) > 0 && length(local.az.subnet.name) > local.az.subnet.min_length
    }

    synapse_workspace = {
      valid_name = length(regexall(local.az.synapse_workspace.regex, local.az.synapse_workspace.name)) > 0 && length(local.az.synapse_workspace.name) > local.az.synapse_workspace.min_length
    }

    template_deployment = {
      valid_name = length(regexall(local.az.template_deployment.regex, local.az.template_deployment.name)) > 0 && length(local.az.template_deployment.name) > local.az.template_deployment.min_length
    }

    traffic_manager_profile = {
      valid_name = length(regexall(local.az.traffic_manager_profile.regex, local.az.traffic_manager_profile.name)) > 0 && length(local.az.traffic_manager_profile.name) > local.az.traffic_manager_profile.min_length
    }

    user_assigned_identity = {
      valid_name = length(regexall(local.az.user_assigned_identity.regex, local.az.user_assigned_identity.name)) > 0 && length(local.az.user_assigned_identity.name) > local.az.user_assigned_identity.min_length
    }

    virtual_machine = {
      valid_name = length(regexall(local.az.virtual_machine.regex, local.az.virtual_machine.name)) > 0 && length(local.az.virtual_machine.name) > local.az.virtual_machine.min_length
    }

    virtual_machine_extension = {
      valid_name = length(regexall(local.az.virtual_machine_extension.regex, local.az.virtual_machine_extension.name)) > 0 && length(local.az.virtual_machine_extension.name) > local.az.virtual_machine_extension.min_length
    }

    virtual_machine_scale_set = {
      valid_name = length(regexall(local.az.virtual_machine_scale_set.regex, local.az.virtual_machine_scale_set.name)) > 0 && length(local.az.virtual_machine_scale_set.name) > local.az.virtual_machine_scale_set.min_length
    }

    virtual_machine_scale_set_extension = {
      valid_name = length(regexall(local.az.virtual_machine_scale_set_extension.regex, local.az.virtual_machine_scale_set_extension.name)) > 0 && length(local.az.virtual_machine_scale_set_extension.name) > local.az.virtual_machine_scale_set_extension.min_length
    }

    virtual_network = {
      valid_name = length(regexall(local.az.virtual_network.regex, local.az.virtual_network.name)) > 0 && length(local.az.virtual_network.name) > local.az.virtual_network.min_length
    }

    virtual_network_gateway = {
      valid_name = length(regexall(local.az.virtual_network_gateway.regex, local.az.virtual_network_gateway.name)) > 0 && length(local.az.virtual_network_gateway.name) > local.az.virtual_network_gateway.min_length
    }

    virtual_network_peering = {
      valid_name = length(regexall(local.az.virtual_network_peering.regex, local.az.virtual_network_peering.name)) > 0 && length(local.az.virtual_network_peering.name) > local.az.virtual_network_peering.min_length
    }

    virtual_wan = {
      valid_name = length(regexall(local.az.virtual_wan.regex, local.az.virtual_wan.name)) > 0 && length(local.az.virtual_wan.name) > local.az.virtual_wan.min_length
    }

    windows_virtual_machine = {
      valid_name = length(regexall(local.az.windows_virtual_machine.regex, local.az.windows_virtual_machine.name)) > 0 && length(local.az.windows_virtual_machine.name) > local.az.windows_virtual_machine.min_length
    }

    windows_virtual_machine_scale_set = {
      valid_name = length(regexall(local.az.windows_virtual_machine_scale_set.regex, local.az.windows_virtual_machine_scale_set.name)) > 0 && length(local.az.windows_virtual_machine_scale_set.name) > local.az.windows_virtual_machine_scale_set.min_length
    }

  }
}
