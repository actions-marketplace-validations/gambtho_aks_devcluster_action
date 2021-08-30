[![.github/workflows/test.yml](https://github.com/gambtho/aks_devcluster_action/actions/workflows/test.yml/badge.svg)](https://github.com/gambtho/aks_devcluster_action/actions/workflows/test.yml)

# AKS Dev Cluster Creation action

This action creates an Azure Kubernetes Service Cluster for use in development

## Setup

Making use of this action requires an Azure Service Principal and a resource group

These can be created using the setup.sh script in this repo

```
./env_setup.sh -c <<resource group name>> -s <<subscription id>> -r <<region>>
```

The output from this command should look like this and matches the variables that need to be passed to the action

```
RESOURCE_GROUP_NAME: newGroup
ARM_CLIENT_ID: ******
ARM_CLIENT_SECRET: ******
ARM_SUBSCRIPTION_ID: ******
ARM_TENANT_ID: ******
```


## Inputs

* `CLUSTER_NAME` ***required***
* `RESOURCE_GROUP_NAME` ***required***
* `ARM_CLIENT_ID` ***required***
* `ARM_CLIENT_SECRET` ***required***
* `ARM_SUBSCRIPTION_ID` ***required***
* `ARM_TENANT_ID` ***required***


## Example usage
```
uses: actions/aks_devcluster_action@v1
with:
  CLUSTER_NAME: testCluster
  RESOURCE_GROUP_NAME: newGroup
  ARM_CLIENT_ID: ******
  ARM_CLIENT_SECRET: ******
  ARM_SUBSCRIPTION_ID: ******
  ARM_TENANT_ID: ******
```

Full deployment workflow showing this action in use - https://github.com/gambtho/go_echo

## References

* https://docs.microsoft.com/en-us/azure/aks/kubernetes-action
* https://github.com/Azure/actions-workflow-samples/tree/master/Kubernetes
