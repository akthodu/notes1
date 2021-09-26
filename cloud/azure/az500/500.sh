#!/bin/bash
echo testing
USER_NAME="cloud_user_p_e6ccf661@azurelabs.linuxacademy.com"
VNET1_NAME=vnet1
VNET1_ADDRESS_PREFIXES="10.0.0.0/16"
VNET1_SUBNET1_PREFIX="10.0.0.0/24"
VNET1_SUBNET1_NAME=MySubnet1

VM1_NAME=myvm1
VM1_IMAGE_NAME=UbuntuLTS
SIZE1="Standard_DS2_v2"
VM1_ADMIN_USERNAME=azureuser

VM2_NAME=myvm2
VM2_IMAGE_NAME=Win2019Datacenter
SIZE1="Standard_DS2_v2"
VM2_ADMIN_USERNAME=azureuser
VM2_ADMIN_PASSWORD=Lansdale2021!
STORAGEACCOUNT=sa

#Red: https://docs.microsoft.com/en-us/cli/azure/query-azure-cli
pSUBSCRIPTION_ID=$(az account list --query "[?user.name=='$USER_NAME'].id" -o tsv)

echo $SUBSCRIPTION_ID

az account set --subscription $SUBSCRIPTION_ID
echo "This is the default subscription"
az account show


echo " This is group list"
RESOURCE_GROUP_ARRAY=$(az group list --subscription $SUBSCRIPTION_ID --query '[].{Name:name,location:location}' -o table|tail -1)
RESOURCE_GROUP=$(echo $RESOURCE_GROUP_ARRAY|awk '{print $1}')
RESOURCE_GROUP_LOCATION=$(echo $RESOURCE_GROUP_ARRAY|awk '{print $2}')

echo $RESOURCE_GROUP_ARRAY  :  $RESOURCE_GROUP --- $RESOURCE_GROUP_LOCATION

az network vnet create -g $RESOURCE_GROUP -n $VNET1_NAME --address-prefix $VNET1_ADDRESS_PREFIXES \
--subnet-name $VNET1_SUBNET1_NAME --subnet-prefix $VNET1_SUBNET1_PREFIX



az vm create -n $VM1_NAME -g $RESOURCE_GROUP --image $VM1_IMAGE_NAME --vnet-name $VNET1_NAMaz group list --subscription $SUBSCRIPTION_ID --query "[].name" -o tsv --subnet $VNET1_SUBNET1_NAME \
--ssh-key-value ~/.ssh/id_rsa.pub --admin-username=$VM1_ADMIN_USERNAME  --public-ip-sku Standard



az vm create -n $VM2_NAME -g $RESOURCE_GROUP --image $VM2_IMAGE_NAME --vnet-name $VNET1_NAME --subnet $VNET1_SUBNET1_NAME \
 --admin-username=$VM2_ADMIN_USERNAME --admin-password=$VM2_ADMIN_PASSWORD  --public-ip-sku Standard

az vm list -o tsv

# AKS1_CLUSTER_NAME=myAKSCluster1
# az aks create --resource-group $RESOURCE_GROUP --name $AKS1_CLUSTER_NAME --node-count 1 --enable-addons monitoring

# az provider show -n Microsoft.OperationsManagement -o table


#az storage account create -n testing$RANDOM -g $RESOURCE_GROUP -l $RESOURCE_GROUP_LOCATION --sku Standard_LRS