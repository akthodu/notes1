#!/bin/bash
echo testing
USER_NAME="cloud_user_p_f93df562@azurelabs.linuxacademy.com"
VNET1_NAME=vnet1
VNET1_ADDRESS_PREFIXES="10.0.0.0/16"
VNET1_SUBNET1_PREFIX="10.0.0.0/24"
VNET1_SUBNET1_NAME=MySubnet1

VM_NAME1=myvm1
IMAGE_NAME=UbuntuLTS
SIZE1="Standard_DS2_v2"

#Red: https://docs.microsoft.com/en-us/cli/azure/query-azure-cli
SUBSCRIPTION_ID=$(az account list --query "[?user.name=='$USER_NAME'].id" -o tsv)

echo $SUBSCRIPTION_ID

az account set --subscription $SUBSCRIPTION_ID
echo "This is the default subscription"
az account show


echo " This is group list"
RESOURCE_GROUP=$(az group list --subscription $SUBSCRIPTION_ID --query "[].name" -o tsv)

#az network vnet create -g $RESOURCE_GROUP -n $VNET1_NAME --address-prefix $VNET1_ADDRESS_PREFIXES \
#--subnet-name $VNET1_SUBNET1_NAME --subnet-prefix $VNET1_SUBNET1_PREFIX



az vm create -n $VM_NAME1 -g $RESOURCE_GROUP --image $IMAGE_NAME --vnet-name $VNET1_NAME --subnet $VNET1_SUBNET1_NAME \
--ssh-key-value ~/.ssh/id_rsa.pub --admin-username=azureuser  --public-ip-sku Standard

az vm list -o tsv



