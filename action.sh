#!/bin/sh -l

export ARM_CLIENT_ID=$INPUT_ARM_CLIENT_ID
export ARM_CLIENT_SECRET=$INPUT_ARM_CLIENT_SECRET
export ARM_SUBSCRIPTION_ID=$INPUT_ARM_SUBSCRIPTION_ID
export ARM_TENANT_ID=$INPUT_ARM_TENANT_ID

export CLUSTER_NAME=$INPUT_CLUSTER_NAME
export RESOURCE_GROUP_NAME=$INPUT_RESOURCE_GROUP_NAME


echo "*******************"
echo "Use Service Principal to Login to Azure"
echo "*******************"

az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID &> /dev/null

echo "*******************"
echo "Create Azure Container Registry"
echo "*******************"

az acr create --resource-group $RESOURCE_GROUP_NAME --name $CLUSTER_NAME --sku Basic

echo "*******************"
echo "Create Azure Kubernetes Service Cluster"
echo "*******************"

az aks create --resource-group $RESOURCE_GROUP_NAME --name $CLUSTER_NAME --node-count 1 --generate-ssh-keys



