# dap-ops-code
for data analytics platform

### Setup

Create a service principal:
```
az ad sp create-for-rbac --name o1hp-sp-dap-ops  --sdk-auth --role "Owner" --scopes /subscriptions/2104e93b-4560-42ec-8c1b-8f18eda53627
```

### Setup github action runner

In order to setup the github action runner, the github action registration token needs to be supplied. This needs to be done by an organization admin and can be requested from Kubota IT. The registration token needs to be supplied as an github secret with the name: `RUNNER_REGISTRATION_TOKEN`.

The token needs to be generated and set **every time** the VM is recreated.

#### Github action runner - debugging

The creation of the vm will succeed even if the github action runner install script fails. In order to investigate why the github action runniner installation failed the logs can be found at: `/var/log/cloud-init.log`.

To debug the github runner itself, the logs can be found in `/actions-runner`.

### Setup Pre-Commit (Optional)

A pre-commit config is available for running checks before pushing towards remote.

To setup pre-commit:

1. Install pre-commit: https://pre-commit.com/
2. Run `pre-commit install`
3. Run `pre-commit run --all-files` and check if everything passes.