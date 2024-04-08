# This is a script for provisioning resources and services for DEV, UAT and PROD environments for Ricoh in the Azure cloud. All resources and services are created in a resource group under one vnet, with each service in its own subnet. The resources and services include: an AKS cluster, an MSSQL database, a Redis cache, a Key Vault, a Storage Account, a Log Analytics Workspace, an application gateway, a jumpbox, and a bastion host, two app services, and a service bus, and a data factory. All services have their own subnet, except for the jumpbox and bastion host, which share a subnet. The jumpbox and bastion host are used for remote access to the other resources.

# Below are steps of provisioning:
# 1. Create a resource group
# 2. Create a vnet
# 3. Create a jumpbox and a bastion host
# 4. Create a MSSQL database
# 5. Create a Redis cache
# 6. Create a Key Vault
# 7. Create a Storage Account
# 8. Create a Log Analytics Workspace
# 9. Create an AKS cluster
# 10. Create an application gateway
# 11. Create two app services
# 12. Create a service bus
# 13. Create a data factory

### Below are the parameters for provisioning:
# Resource group name, Location, Vnet

ENV=dev
RESOURCE_GROUP=rg-zkpytug-rhk-ucp-${ENV}
REGION=eastasia
VNET_NAME=vnet-zkpytug-rhk-ucp-${ENV}-01
VNET_ADDRESS_PREFIX=10.100.0.0/20

# Key Vault name
KV_NAME=kv-zkpytug-rhk-ucp-${ENV}-01
#MS_AZURE_APP_SERVICE_OBJECT_ID=36fe157b-1312-485f-b0c4-700a72d011f4
MS_AZURE_APP_SERVICE_OBJECT_ID=36fe157b-1312-485f-b0c4-700a72d011f4

# AKS cluster
AKS_CLUSTER_NAME=aks-zkpytug-rhk-ucp-${ENV}-01
AKS_SUBNET_NAME=snet-zkpytug-rhk-ucp-aks-${ENV}-01
AKS_SUBNET_PREFIX=10.100.0.0/22
AKS_SUBNET_START_IP=10.100.0.1
AKS_SUBNET_END_IP=10.100.3.254
AKS_CLUSTER_ILB_IP=10.100.3.200
SERVICE_CIDR=10.100.16.0/22
DNS_SERVICE_IP=10.100.16.10
MAX_POD_NUMBER=250
K8S_VERSION=1.28
AKS_NODECOUNT=2
AKS_NODECOUNT_MIN=2
AKS_NODECOUNT_MAX=2
AKS_NODE_VM_COMPUTESIZE=Standard_B2s
AKS_SYS_NODE_VM_COMPUTESIZE=Standard_D2s_v3
AKS_USER_NODE_VM_COMPUTESIZE=Standard_D2s_v3
AKS_USER_NODEPOOL_NAME=userpool
AKS_USER_NODE_OS=Linux
MCRG=MC_"$RESOURCE_GROUP"_"$AKS_CLUSTER_NAME"_"$REGION"
ACR_NAME=zkpytugest${ENV}
AKS_CLUSTER_INTERNAL_DNS_NAME=rcp-k8s${ENV}
AKS_CLUSTER_ILB_DNS_NAME=ilb${ENV}
AKS_NSG_NAME=nsg-zkpytug-rhk-ucp-aks-${ENV}-01
AKS_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-aks-${ENV}-01

# SSL certs
ZKPYTUGCOM_CERT=zkpytugcom
ZKPYTUGCOM_CERT_PASSWORD=password
ZKPYTUGCOM_HOSTNAMES="zkpytug.com *.zkpytug.com"

zkpytugcom_CERT=zkpytugcom2023-2024
zkpytugcom_HOSTNAMES="zkpytug.com *.zkpytug.com"

# Application gateway
APPGW_NAME=agw-zkpytug-rhk-ucp-${ENV}-01
APPGW_IDENTITY=id-zkpytug-rhk-ucp-${ENV}-01
APPGW_PREFIX=10.100.5.0/27
APPGW_PRIVATE_IP=10.100.5.10
APPGW_SUBNET_NAME=snet-zkpytug-rhk-ucp-agw-${ENV}-01
APPGW_PUBLIC_IP_NAME=pip-agw-zkpytug-rhk-ucp-${ENV}-01
APPGW_WAF_POLICY_NAME=wafp-zkpytug-rhk-ucp-${ENV}-01
APPGW_NSG_NAME=nsg-zkpytug-rhk-ucp-agw-${ENV}-01
APPGW_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-agw-${ENV}-01

# App services
#APP1_NAME=app1-zkpytug-rhk-ucp-${ENV}-01
#APP2_NAME=app2-zkpytug-rhk-ucp-${ENV}-01

# App services plan
APP_SERVICE_PLAN_NAME=asp-zkpytug-rhk-ucp-${ENV}-01
APP_SERVICE_PLAN_SKU=P2V3
APP_SERVICE_PLAN_SIZE=S1
APP_SERVICE_PLAN_WORKER_SIZE=1
APP_SERVICE_PLAN_WORKER_COUNT=1
APP_SERVICE_PLAN_LOCATION=eastasia
APP_SERVICE_PLAN_RESOURCE_GROUP=rg-zkpytug-rhk-ucp-${ENV}

#APP1_INBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-app-${ENV}-01
#APP1_INBOUND_SUBNET_NSG=nsg-zkpytug-rhk-ucp-app-${ENV}-01
#APP1_INBOUND_SUBNET_PREFIX=10.100.4.32/27
#APP1_OUTBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-app-${ENV}-02
#APP1_OUTBOUND_SUBNET_NSG=nsg-zkpytug-rhk-ucp-app-${ENV}-02
#APP1_OUTBOUND_SUBNET_PREFIX=10.100.4.64/27
#APP1_OUTBOUND_SUBNET_START_IP=10.100.4.65
#APP1_OUTBOUND_SUBNET_END_IP=10.100.4.94
#APP1_PRIVATE_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-app-${ENV}-01

#APP2_INBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-app-${ENV}-03
#APP2_INBOUND_SUBNET_NSG=nsg-zkpytug-rhk-ucp-app-${ENV}-03
#APP2_INBOUND_SUBNET_PREFIX=10.100.5.128/27
#APP2_OUTBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-app-${ENV}-04
#APP2_OUTBOUND_SUBNET_NSG=nsg-zkpytug-rhk-ucp-app-${ENV}-04
#APP2_OUTBOUND_SUBNET_PREFIX=10.100.5.160/27
#APP2_OUTBOUND_SUBNET_START_IP=10.100.5.161
#APP2_OUTBOUND_SUBNET_END_IP=10.100.5.190
#APP2_PRIVATE_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-app-${ENV}-02

# Azure function
FUNC_NAME=function-zkpytug-rhk-ucp-${ENV}-01
FUNC_INBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_OUTBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-func-${ENV}-02
FUNC_INBOUND_SUBNET_PREFIX=10.100.4.160/27
FUNC_OUTBOUND_SUBNET_PREFIX=10.100.4.192/27
FUNC_OUTBOUND_SUBNET_START_IP=10.100.4.193
FUNC_OUTBOUND_SUBNET_END_IP=10.100.4.222
FUNC_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_STORAGE_ACCOUNT_NAME=stfunczkpytugrhkucp${ENV}01
FUNC_APP_INSIGHTS_NAME=appinsights-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_APP_SERVICE_PLAN_NAME=asp-zkpytug-rhk-ucp-${ENV}-01
FUNC_APP_SERVICE_PLAN_SKU=S1
FUNC_APP_SERVICE_PLAN_SIZE=S1
FUNC_SERVICE_PLAN_LOCATION=eastasia
FUNC_APP_SERVICE_PLAN_WORKER_SIZE=1
FUNC_APP_SERVICE_PLAN_WORKER_COUNT=1
FUNC_APP_NSG_INBOUND=nsg-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_APP_NSG_OUTBOUND=nsg-zkpytug-rhk-ucp-func-${ENV}-02
FUNC_APP_ROUTE_TABLE_NAME_INBOUND=rt-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND=rt-zkpytug-rhk-ucp-func-${ENV}-02

# MYSQL
SQL_SERVER_NAME=sql-zkpytug-rhk-ucp-${ENV}-01
SQL_DATABASE_NAME=sqldb-zkpytug-rhk-ucp-${ENV}-01
SQL_ADMIN_USERNAME=sqladmin
SQL_ADMIN_PASSWORD=Password1234
SQL_SUBNET_NAME=snet-zkpytug-rhk-ucp-sql-${ENV}-01
SQL_SUBNET_PREFIX=10.100.4.32/27
SQL_NSG_NAME=nsg-zkpytug-rhk-ucp-sql-${ENV}-01
SQL_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-sql-${ENV}-01
SQL_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-sql-${ENV}-01

# Storage Persistent Volume
STORAGE_ACCOUNT_NAME=storzkpytugrhkucp${ENV}
STORAGE_SUBNET_NAME=snet-zkpytug-rhk-ucp-stor-${ENV}-01
STORAGE_SUBNET_PREFIX=10.100.4.64/27
STORAGE_CONTAINER_NAME=con01
STORAGE_BLOB_NAME=blob01
STORAGE_BLOB_FILE=blobfile01
STORAGE_SHARE_NAME=fs01
STORAGE_ENDPOINT_NAME_BLOB=pe-zkpytug-rhk-ucp-stor-blob-${ENV}-01
STORAGE_ENDPOINT_NAME_FILESHARE=pe-zkpytug-rhk-ucp-stor-fileshare-${ENV}-01
STORAGE_NSG_NAME=nsg-zkpytug-rhk-ucp-stor-${ENV}-01
STORAGE_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-stor-${ENV}-01

# Windows Jumpbox

VM_NAME=vmucpadm${ENV}01
VM_SUBNET_NAME=snet-zkpytug-rhk-ucp-adm-${ENV}-01
VM_SUBNET_PREFIX=10.100.4.96/27
VM_NSG_NAME=nsg-zkpytug-rhk-ucp-adm-${ENV}-01
VM_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-adm-${ENV}-01
VM_SIZE=Standard_B2s
VM_STATIC_IP=10.100.4.100

# Service bus
SB_NAME=sb-zkpytug-rhk-ucp-${ENV}-01
SB_SUBNET_NAME=snet-zkpytug-rhk-ucp-sb-${ENV}-01
SB_SUBNET_PREFIX=10.100.4.128/27

# Private DNS
DNS_ZONE_NAME_1=privatelink.azurewebsites.net
DNS_ZONE_NAME_2=zkpytug.com
DNS_ZONE_NAME_3=zkpytug.com
DNS_ZONE_NAME_4=privatelink.redis.cache.windows.net
DNS_ZONE_NAME_5=privatelink.blob.core.windows.net
DNS_ZONE_NAME_6=privatelink.file.core.windows.net
DNS_ZONE_NAME_7=privatelink.database.windows.net

ADF_NAME=adf-zkpytug-rhk-ucp-${ENV}-01
ADF_SUBNET_NAME=snet-zkpytug-rhk-ucp-adf-${ENV}-01
ADF_SUBNET_PREFIX=10.100.4.224/27
ADF_NSG_NAME=nsg-zkpytug-rhk-ucp-adf-${ENV}-01
ADF_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-adf-${ENV}-01
ADF_PRIVATE_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-adf-${ENV}-01

MISC_SUBNET_NAME=snet-zkpytug-rhk-ucp-misc-${ENV}-01
MISC_SUBNET_PREFIX=10.100.5.32/27
MISC_NSG_NAME=nsg-zkpytug-rhk-ucp-misc-${ENV}-01
MISC_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-misc-${ENV}-01

# Log Analytics Workspace name
LOG_ANALYTICS_WORKSPACE_NAME=log-zkpytug-rhk-ucp-${ENV}-01

# App Insights name
APP_INSIGHTS_NAME=appi-zkpytug-rhk-ucp-${ENV}-01

AZURE_MONITORING_WORKSPACE_NAME=azmon-zkpytug-rhk-ucp-${ENV}-01
AZURE_MONITORING_WORKSPACE_LOCATION=eastasia

### Below are the commands for provisioning

# Resource group name, Location, Vnet

az group create --name $RESOURCE_GROUP --location $REGION

# Create Log Analytics Workspace
az monitor log-analytics workspace create --resource-group $RESOURCE_GROUP --workspace-name $LOG_ANALYTICS_WORKSPACE_NAME --location $REGION

# Create a Workspace-Based App Insight for the above Log Analytics Workspace
az monitor app-insights component create --app $APP_INSIGHTS_NAME --location $REGION --resource-group $RESOURCE_GROUP --application-type web --kind web --tags "env=$ENV" --workspace $LOG_ANALYTICS_WORKSPACE_NAME

#az monitor app-insights component create --app $APP_INSIGHTS_NAME --location $REGION --resource-group $RESOURCE_GROUP --application-type web --kind web --retention-time 120 --tags "env=$ENV"

# Create Vnet
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME --address-prefixes $VNET_ADDRESS_PREFIX
VNET_ID=$(az network vnet show --resource-group $RESOURCE_GROUP --name $VNET_NAME --query id -o tsv)
echo $VNET_ID

# Create subnet for misc
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $MISC_SUBNET_NAME --address-prefixes $MISC_SUBNET_PREFIX

# Create subnet for adf
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $ADF_SUBNET_NAME --address-prefixes $ADF_SUBNET_PREFIX

# Create subnet for service bus
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SB_SUBNET_NAME --address-prefixes $SB_SUBNET_PREFIX

# Create an Azure service bus
az servicebus namespace create --resource-group $RESOURCE_GROUP --name $SB_NAME --location $REGION --sku Standard

# Key Vault
#KV_ID=$(az keyvault create --name $KV_NAME --resource-group $RESOURCE_GROUP --location $REGION --enable-rbac-authorization --query id -o tsv)
KV_ID=$(az keyvault create --name $KV_NAME --resource-group $RESOURCE_GROUP --location $REGION --query id -o tsv)
#get kevault id by keyvault name
KV_ID=$(az keyvault show --name $KV_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
echo "KV_ID $KV_ID"

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $MS_AZURE_APP_SERVICE_OBJECT_ID

az role assignment create --assignee $MS_AZURE_APP_SERVICE_OBJECT_ID --role "Key Vault Secrets User" --scope $KV_ID
az role assignment create --assignee $MS_AZURE_APP_SERVICE_OBJECT_ID --role "Key Vault Reader" --scope $KV_ID
az role assignment create --assignee $MS_AZURE_APP_SERVICE_OBJECT_ID --role "Key Vault Certificates Officer" --scope $KV_ID
az role assignment create --assignee $MS_AZURE_APP_SERVICE_OBJECT_ID --role "Key Vault Secrets Officer" --scope $KV_ID
az role assignment create --assignee $MS_AZURE_APP_SERVICE_OBJECT_ID --role "Key Vault Crypto Officer" --scope $KV_ID

#create operator_id role assignment
operator_id=$(az ad signed-in-user show --query id -o tsv)
echo "operator_id $operator_id"

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $operator_id
az role assignment create --assignee $operator_id --role "Reader" --scope $KV_ID
az role assignment create --assignee $operator_id --role "Key Vault Certificates Officer" --scope $KV_ID
az role assignment create --assignee $operator_id --role "Key Vault Secrets Officer" --scope $KV_ID
az role assignment create --assignee $operator_id --role "Key Vault Crypto Officer" --scope $KV_ID

# create db password secret
az keyvault secret set --vault-name $KV_NAME --name ${SQL_DATABASE_NAME}-password --value ${SQL_ADMIN_PASSWORD}

# generate pfx from crt and key
openssl pkcs12 -export -out $ZKPYTUGCOM_CERT.pfx -inkey $ZKPYTUGCOM_CERT.key -in $ZKPYTUGCOM_CERT.crt -password pass:$ZKPYTUGCOM_CERT_PASSWORD

# upload cert to key vault
az keyvault certificate import --vault-name $KV_NAME --name $ZKPYTUGCOM_CERT --file $ZKPYTUGCOM_CERT.pfx --password $ZKPYTUGCOM_CERT_PASSWORD

# Create Private DNS Zone
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_1
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_2
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_3
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_4
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_5
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_6
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_7

# Create Private DNS Link
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_1 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_3 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_4 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_5 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_6 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_7 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false

#Create VM with a static Public IP address and static private IP address
az network public-ip create --resource-group $RESOURCE_GROUP --name $VM_NAME-pip --sku Standard --allocation-method static --location $REGION
az network nic create --resource-group $RESOURCE_GROUP --name $VM_NAME-nic --vnet-name $VNET_NAME --subnet $VM_SUBNET_NAME --public-ip-address $VM_NAME-pip --private-ip-address $VM_STATIC_IP
az vm create --resource-group $RESOURCE_GROUP --name $VM_NAME --image Win2022Datacenter --admin-username azureuser --admin-password Password1234 --nics $VM_NAME-nic --size $VM_SIZE --location $REGION

# Create an AKS cluster

echo "Create AKS"

AKS_SUBNET_ID=$(az network vnet subnet create --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $AKS_SUBNET_NAME --address-prefixes $AKS_SUBNET_PREFIX --query id -o tsv)
echo "AKS_SUBNET_ID $AKS_SUBNET_ID"

az aks create --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME --network-plugin azure --service-cidr $SERVICE_CIDR --dns-service-ip $DNS_SERVICE_IP --vnet-subnet-id $AKS_SUBNET_ID --enable-managed-identity --generate-ssh-keys -s $AKS_SYS_NODE_VM_COMPUTESIZE \
--enable-secret-rotation \
--load-balancer-sku Standard \
--kubernetes-version $K8S_VERSION \
--enable-cluster-autoscaler \
--node-count $AKS_NODECOUNT \
--min-count $AKS_NODECOUNT_MIN \
--max-count $AKS_NODECOUNT_MAX \
--network-plugin azure \
--zones 1 2 3 \
--nodepool-name systempool \
--enable-secret-rotation \
--enable-addons monitoring,azure-keyvault-secrets-provider,azure-policy
#--max-pods $MAX_POD_NUMBER

echo "Assign Network Contributor Role of Vnet to AKS cluster"
AKS_IDENTITY_ID=$(az aks show --name $AKS_CLUSTER_NAME --resource-group $RESOURCE_GROUP --query identity.principalId -o tsv)
echo "AKS_IDENTITY_ID $AKS_IDENTITY_ID"

#AKS_SP_ID=$(az ad sp list --display-name $AKS_CLUSTER_NAME --query "[0].appId" -o tsv)
#echo "AKS_SP_ID $AKS_SP_ID"

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $AKS_IDENTITY_ID

az role assignment create --assignee $AKS_IDENTITY_ID --role "Network Contributor" --scope $VNET_ID
az role assignment create --assignee $AKS_IDENTITY_ID --role "Key Vault Secrets User" --scope $KV_ID
az role assignment create --assignee $AKS_IDENTITY_ID --role "Key Vault Reader" --scope $KV_ID
az role assignment create --assignee $AKS_IDENTITY_ID --role "Key Vault Crypto Officer" --scope $KV_ID
az role assignment create --assignee $AKS_IDENTITY_ID --role "Key Vault Secrets Officer" --scope $KV_ID
az role assignment create --assignee $AKS_IDENTITY_ID --role "Key Vault Certificates Officer" --scope $KV_ID

#echo "Create System Nodepool"
#az aks nodepool add \
#--cluster-name $AKS_CLUSTER_NAME \
#--name $AKS_SYS_NODEPOOL_NAME \
#--resource-group $RESOURCE_GROUP \
#--node-vm-size $AKS_SYS_NODE_VM_COMPUTESIZE \
#--mode system \
#--enable-cluster-autoscaler \
#--min-count $AKS_NODECOUNT_MIN \
#--max-count $AKS_NODECOUNT_MAX \
#--node-count $AKS_NODECOUNT \
#--zones 1 2 3 \
#--os-type $AKS_USER_NODE_OS \
#--max-pods 512

echo "Create User Nodepool"
az aks nodepool add \
--cluster-name $AKS_CLUSTER_NAME \
--name $AKS_USER_NODEPOOL_NAME \
--resource-group $RESOURCE_GROUP \
--node-vm-size $AKS_USER_NODE_VM_COMPUTESIZE \
--mode user \
--enable-cluster-autoscaler \
--min-count $AKS_NODECOUNT_MIN \
--max-count $AKS_NODECOUNT_MAX \
--node-count $AKS_NODECOUNT \
--zones 1 2 3 \
--nodepool-name $AKS_USER_NODEPOOL_NAME \
--os-type $AKS_USER_NODE_OS
#--max-pods $MAX_POD_NUMBER

AKS_AGENTPOOL_SP_ID=$(az ad sp list --display-name ${AKS_CLUSTER_NAME}-agentpool --query "[0].appId" -o tsv)
echo "AKS_AGENTPOOL_SP_ID $AKS_AGENTPOOL_SP_ID"
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Network Contributor" --scope $VNET_ID
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Key Vault Secrets User" --scope $KV_ID
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Key Vault Reader" --scope $KV_ID
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Key Vault Crypto Officer" --scope $KV_ID
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Key Vault Secrets Officer" --scope $KV_ID
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Key Vault Certificates Officer" --scope $KV_ID

AKS_AGENTPOOL_ID=$(az ad sp list --display-name ${AKS_CLUSTER_NAME}-agentpool --query "[0].id" -o tsv)
az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $AKS_AGENTPOOL_ID

echo "Get AKS Credentials"

az aks get-credentials -n $AKS_CLUSTER_NAME -g $RESOURCE_GROUP --admin --overwrite-existing

#Install Ingress Nginx
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.4/deploy/static/provider/cloud/deploy.yaml
#kubectl apply -f ingress-nginx.yaml
#
# Reference 1: https://platform9.com/learn/v1.0/tutorials/nginix-controller-helm
# Reference 2: https://kubernetes.github.io/ingress-nginx/deploy
# Reference 3: https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm
#
echo "Install ingress-nginx"
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --version 4.8.3

kubectl annotate -n ingress-nginx service ingress-nginx-controller service.beta.kubernetes.io/azure-load-balancer-ipv4=$AKS_CLUSTER_ILB_IP
kubectl annotate -n ingress-nginx service ingress-nginx-controller service.beta.kubernetes.io/azure-load-balancer-internal=true

kubectl -n ingress-nginx patch service ingress-nginx-controller -p '{"spec":{"externalTrafficPolicy":"Local"}}'

sleep 60

ingressip=$(kubectl get service -n ingress-nginx -o=jsonpath='{.items[*].status.loadBalancer.ingress[0].ip}')
echo "ingressip $ingressip"

echo "Create namespace Ricoh"
kubectl create namespace ricoh
#Install ssl cert
kubectl create secret tls ingress-cert --namespace ricoh --key zkpytugcom.key --cert zkpytugcom.crt
kubectl create secret tls ingress-cert-zkpytugcom --namespace ricoh --key zkpytugcom.key --cert zkpytugcom.crt
kubectl apply -f aks-helloworld-one.yaml
kubectl apply -f aks-helloworld-two.yaml
kubectl apply -f generated-server.yaml
kubectl apply -f spring-boot-server.yaml

ip=""
while [ -z $ip ]; do
  echo "Waiting for Service One IP ..."
  ip=$(kubectl -n ricoh -o json get service aks-helloworld-one -o=jsonpath="{.spec.clusterIP}")
  [ -z "$ip" ] && sleep 10
done
echo 'Service One IP: '$ip

ip=""
while [ -z $ip ]; do
  echo "Waiting for Service Two IP ..."
  ip=$(kubectl -n ricoh -o json get service aks-helloworld-two -o=jsonpath="{.spec.clusterIP}")
  [ -z "$ip" ] && sleep 10
done
echo 'Service Two IP: '$ip

sleep 30
kubectl apply -f ingress-tls.yaml
sleep 30

ip=""
while [ -z $ip ]; do
  echo "Waiting for Ingress IP ..."
  kubectl get ingress -n ricoh -o=jsonpath='{.items[*].status.loadBalancer}'
  echo ''
  ip=$(kubectl get ingress -n ricoh -o=jsonpath='{.items[*].status.loadBalancer.ingress[0].ip}')
  echo 'Ingress IP: '$ip
  [ -z "$ip" ] && sleep 10
done
echo 'Ingress IP: '$ip

ilbingressip=$ip
echo "ilbingressip $ilbingressip"

#create a private dns A record for ingress ip
az network private-dns record-set a create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --name $AKS_CLUSTER_INTERNAL_DNS_NAME
az network private-dns record-set a add-record --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --record-set-name $AKS_CLUSTER_INTERNAL_DNS_NAME --ipv4-address $AKS_CLUSTER_ILB_IP
az network private-dns record-set a create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_3 --name $AKS_CLUSTER_INTERNAL_DNS_NAME
az network private-dns record-set a add-record --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_3 --record-set-name $AKS_CLUSTER_INTERNAL_DNS_NAME --ipv4-address $AKS_CLUSTER_ILB_IP

# Print out the ingress IP
echo "Get service"
kubectl get service -n ingress-nginx
kubectl describe svc ingress-nginx-controller -n ingress-nginx
kubectl get ingress -n ricoh
kubectl describe ingress hello-world-ingress -n ricoh
kubectl get pods -n ricoh -o wide
kubectl get pods -n ingress-nginx
kubectl get pods -n kube-system

# Create an application gateway

echo "Create App Gateway Public IP"
az network public-ip create -n $APPGW_PUBLIC_IP_NAME -g $RESOURCE_GROUP --allocation-method Static --sku Standard --zone 1 2 3

echo "Create App Gateway Subnet"
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME --address-prefixes $APPGW_PREFIX

#echo "Create WAF Policy"
#az network application-gateway waf-policy create --location $REGION -n $APPGW_WAF_POLICY_NAME -g $RESOURCE_GROUP
#az network application-gateway waf-policy policy-setting update --policy-name $APPGW_WAF_POLICY_NAME -g $RESOURCE_GROUP --state Enabled

#echo "Get WAF Policy Id"
#waf_policy_id=$(az network application-gateway waf-policy show --name $APPGW_WAF_POLICY_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
#echo $waf_policy_id

echo "Create App Gateway"
#az network application-gateway create -n $APPGW_NAME -g $RESOURCE_GROUP --sku WAF_v2 --waf-policy $waf_policy_id --public-ip-address $APPGW_PUBLIC_IP_NAME --private-ip-address $APPGW_PRIVATE_IP --vnet-name $VNET_NAME --subnet $APPGW_SUBNET_NAME --priority 100 --zones 1 2 3
az network application-gateway create -n $APPGW_NAME -g $RESOURCE_GROUP --sku Standard_v2 --public-ip-address $APPGW_PUBLIC_IP_NAME --private-ip-address $APPGW_PRIVATE_IP --vnet-name $VNET_NAME --subnet $APPGW_SUBNET_NAME --priority 100 --zones 1 2 3

#--enable-private-link --zones 1 2 3 
#--private-link-subnet $APPGW_SUBNET_NAME 

echo "APPGW_PRIVATE_IP $APPGW_PRIVATE_IP"

APPGW_IDENTITY_ID=$(az identity create --name $APPGW_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
echo "APPGW_IDENTITY_ID $APPGW_IDENTITY_ID"

az network application-gateway identity assign -g $RESOURCE_GROUP --gateway-name $APPGW_NAME --identity $APPGW_IDENTITY_ID
APPGW_IDENTITY_PRINCIPAL_ID=$(az identity show --name $APPGW_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)
echo "APPGW_IDENTITY_PRINCIPAL_ID $APPGW_IDENTITY_PRINCIPAL_ID"

# assign role to appgw identity
az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $APPGW_IDENTITY_PRINCIPAL_ID

az role assignment create --assignee $APPGW_IDENTITY_PRINCIPAL_ID --role "Key Vault Secrets User" --scope $KV_ID
az role assignment create --assignee $APPGW_IDENTITY_PRINCIPAL_ID --role "Key Vault Reader" --scope $KV_ID
az role assignment create --assignee $APPGW_IDENTITY_PRINCIPAL_ID --role "Key Vault Certificates Officer" --scope $KV_ID

# import ssl cert to appgw from key vault
az network application-gateway ssl-cert create --gateway-name $APPGW_NAME --name $zkpytugcom_CERT --resource-group $RESOURCE_GROUP --key-vault-secret-id $(az keyvault secret show --vault-name $KV_NAME --name $zkpytugcom_CERT --query id -o tsv)
az network application-gateway ssl-cert create --gateway-name $APPGW_NAME --name $ZKPYTUGCOM_CERT --resource-group $RESOURCE_GROUP --key-vault-secret-id $(az keyvault secret show --vault-name $KV_NAME --name $ZKPYTUGCOM_CERT --query id -o tsv)

# upload ssl cert to appgw
#az network application-gateway ssl-cert create --gateway-name $APPGW_NAME --name $ZKPYTUGCOM_CERT --resource-group $RESOURCE_GROUP --cert-file $ZKPYTUGCOM_CERT.pfx --cert-password $ZKPYTUGCOM_CERT_PASSWORD

# create a frontend port
az network application-gateway frontend-port create --gateway-name $APPGW_NAME --name appGatewayFrontendPort443 --resource-group $RESOURCE_GROUP --port 443

# get app gateway frontend ip configuration
APPGW_FRONTEND_IP_ID=$(az network application-gateway frontend-ip show --gateway-name $APPGW_NAME --resource-group $RESOURCE_GROUP --name appGatewayFrontendIP --query id -o tsv)

# create app gateway https listener with public ip multi-site hosttype
az network application-gateway http-listener create --gateway-name $APPGW_NAME --name appGatewayHttpsListenerzkpytugcom --resource-group $RESOURCE_GROUP --frontend-port appGatewayFrontendPort443 --frontend-ip $APPGW_FRONTEND_IP_ID --host-names $zkpytugcom_HOSTNAMES --ssl-cert $zkpytugcom_CERT
az network application-gateway http-listener create --gateway-name $APPGW_NAME --name appGatewayHttpsListener --resource-group $RESOURCE_GROUP --frontend-port appGatewayFrontendPort443 --frontend-ip $APPGW_FRONTEND_IP_ID --host-names $ZKPYTUGCOM_HOSTNAMES --ssl-cert $ZKPYTUGCOM_CERT

# create backend settings for aks
az network application-gateway address-pool create --gateway-name $APPGW_NAME --name appGatewayBackendPoolAKSzkpytugcom --resource-group $RESOURCE_GROUP --servers $AKS_CLUSTER_ILB_IP

# create health probe for aks
az network application-gateway probe create --gateway-name $APPGW_NAME --name appGatewayBackendHealthProbezkpytugcom --resource-group $RESOURCE_GROUP --path / --protocol Https --host $AKS_CLUSTER_INTERNAL_DNS_NAME.zkpytug.com --interval 30 --timeout 30 --threshold 3
az network application-gateway probe create --gateway-name $APPGW_NAME --name appGatewayBackendHealthProbe --resource-group $RESOURCE_GROUP --path / --protocol Https --host $AKS_CLUSTER_INTERNAL_DNS_NAME.zkpytug.com --interval 30 --timeout 30 --threshold 3

# create http-settings for aks
az network application-gateway http-settings create --gateway-name $APPGW_NAME --name appGatewayBackendHttpSettingszkpytugcom --resource-group $RESOURCE_GROUP --port 443 --protocol Https --cookie-based-affinity Disabled --timeout 30 --probe appGatewayBackendHealthProbezkpytugcom --host-name $AKS_CLUSTER_INTERNAL_DNS_NAME.zkpytug.com
az network application-gateway http-settings create --gateway-name $APPGW_NAME --name appGatewayBackendHttpSettings --resource-group $RESOURCE_GROUP --port 443 --protocol Https --cookie-based-affinity Disabled --timeout 30 --probe appGatewayBackendHealthProbe --host-name $AKS_CLUSTER_INTERNAL_DNS_NAME.zkpytug.com

# create a rule for aks
az network application-gateway rule create --gateway-name $APPGW_NAME --name appGatewayRulezkpytugcom --resource-group $RESOURCE_GROUP --http-listener appGatewayHttpsListenerzkpytugcom --address-pool appGatewayBackendPoolAKSzkpytugcom --http-settings appGatewayBackendHttpSettingszkpytugcom --priority 190
az network application-gateway rule create --gateway-name $APPGW_NAME --name appGatewayRule --resource-group $RESOURCE_GROUP --http-listener appGatewayHttpsListener --address-pool appGatewayBackendPoolAKSzkpytugcom --http-settings appGatewayBackendHttpSettings --priority 200

# update httpListener with frontend ip multi-site hosttype
#az network application-gateway frontend-port create --gateway-name $APPGW_NAME --name appGatewayFrontendPort80 --resource-group $RESOURCE_GROUP --port 80

az network application-gateway http-listener update --gateway-name $APPGW_NAME --name appGatewayHttpListener --resource-group $RESOURCE_GROUP --frontend-port appGatewayFrontendPort --frontend-ip $APPGW_FRONTEND_IP_ID --host-names $ZKPYTUGCOM_HOSTNAMES
az network application-gateway http-listener create --gateway-name $APPGW_NAME --name appGatewayHttpListenerzkpytugcom --resource-group $RESOURCE_GROUP --frontend-port appGatewayFrontendPort --frontend-ip $APPGW_FRONTEND_IP_ID --host-names $zkpytugcom_HOSTNAMES

# redirect http to https
# create redirect config
az network application-gateway redirect-config create --gateway-name $APPGW_NAME --name appGatewayRedirectConfigzkpytugcom --resource-group $RESOURCE_GROUP --type Permanent --include-query-string true --target-listener appGatewayHttpsListenerzkpytugcom
az network application-gateway redirect-config create --gateway-name $APPGW_NAME --name appGatewayRedirectConfig --resource-group $RESOURCE_GROUP --type Permanent --include-query-string true --target-listener appGatewayHttpsListener

# az network application-gateway rule redirect to https
az network application-gateway rule delete --gateway-name $APPGW_NAME --name rule1 --resource-group $RESOURCE_GROUP
az network application-gateway rule create --gateway-name $APPGW_NAME --name RedirectHttpToHttpszkpytugcom --resource-group $RESOURCE_GROUP --http-listener appGatewayHttpListenerzkpytugcom --redirect-config appGatewayRedirectConfigzkpytugcom --priority 290
az network application-gateway rule create --gateway-name $APPGW_NAME --name RedirectHttpToHttps --resource-group $RESOURCE_GROUP --http-listener appGatewayHttpListener --redirect-config appGatewayRedirectConfig --priority 300

# App services plan
#echo "Create App Service Plan"
#app_plan_id=$(az appservice plan create --name $APP_SERVICE_PLAN_NAME --resource-group $APP_SERVICE_PLAN_RESOURCE_GROUP --sku $APP_SERVICE_PLAN_SKU --is-linux --number-of-workers $APP_SERVICE_PLAN_WORKER_COUNT --location $APP_SERVICE_PLAN_LOCATION)

# App services
#echo "Create App Servcie 1 Subnet"
# create app inbound subnet
#az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_INBOUND_SUBNET_NAME --address-prefixes $APP1_INBOUND_SUBNET_PREFIX

# create app outbound subnet
#az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_OUTBOUND_SUBNET_NAME --address-prefixes $APP1_OUTBOUND_SUBNET_PREFIX

#echo "Create App Service 2 Subnet"
# create app inbound subnet
#az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_INBOUND_SUBNET_NAME --address-prefixes $APP2_INBOUND_SUBNET_PREFIX

# create app outbound subnet
#az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_OUTBOUND_SUBNET_NAME --address-prefixes $APP2_OUTBOUND_SUBNET_PREFIX

#echo "Create App Service 1"
# create app service with vnet integration
#app1_id=$(az webapp create --name $APP1_NAME --resource-group $RESOURCE_GROUP --plan $APP_SERVICE_PLAN_NAME --deployment-container-image-name mcr.microsoft.com/azuredocs/containerapps-helloworld:latest --query id -o tsv)
#echo $app1_id

#create identity for app1_id
#APP1_IDENTITY=$(az webapp identity assign --name $APP1_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)

#az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $APP1_IDENTITY
#az role assignment create --assignee $APP1_IDENTITY --role "Key Vault Secrets User" --scope $KV_ID
#az role assignment create --assignee $APP1_IDENTITY --role "Key Vault Reader" --scope $KV_ID
#az role assignment create --assignee $APP1_IDENTITY --role "Key Vault Certificates Officer" --scope $KV_ID
#az role assignment create --assignee $APP1_IDENTITY --role "Key Vault Secrets Officer" --scope $KV_ID
#az role assignment create --assignee $APP1_IDENTITY --role "Key Vault Crypto Officer" --scope $KV_ID

#import ssl cert to app service 1 from key vault
#az webapp config ssl import --key-vault $KV_NAME --resource-group $RESOURCE_GROUP --name $APP1_NAME --key-vault-certificate-name $ZKPYTUGCOM_CERT

#upload ssl cert to app service 1
#az webapp config ssl upload --certificate-file $ZKPYTUGCOM_CERT.pfx --certificate-password $ZKPYTUGCOM_CERT_PASSWORD --resource-group $RESOURCE_GROUP --name $APP1_NAME

# create app service with vnet integration
#az webapp vnet-integration add --name $APP1_NAME --resource-group $RESOURCE_GROUP --vnet $VNET_NAME --subnet $APP1_OUTBOUND_SUBNET_NAME

#az network private-endpoint create --name $APP1_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $APP1_INBOUND_SUBNET_NAME --private-connection-resource-id $app1_id --connection-name $APP1_PRIVATE_ENDPOINT_NAME --location $REGION --group-ids sites

#az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $APP1_PRIVATE_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_1 --zone-name webapp

#echo "Create App Service 2"

#app2_id=$(az webapp create --name $APP2_NAME --resource-group $RESOURCE_GROUP --plan $APP_SERVICE_PLAN_NAME --deployment-container-image-name mcr.microsoft.com/azuredocs/containerapps-helloworld:latest --query id -o tsv)
#echo $app2_id

#create identity for app2_id
#APP2_IDENTITY=$(az webapp identity assign --name $APP2_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)

#az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $APP2_IDENTITY
#az role assignment create --assignee $APP2_IDENTITY --role "Key Vault Secrets User" --scope $KV_ID
#az role assignment create --assignee $APP2_IDENTITY --role "Key Vault Reader" --scope $KV_ID
#az role assignment create --assignee $APP2_IDENTITY --role "Key Vault Certificates Officer" --scope $KV_ID
#az role assignment create --assignee $APP2_IDENTITY --role "Key Vault Secrets Officer" --scope $KV_ID
#az role assignment create --assignee $APP2_IDENTITY --role "Key Vault Crypto Officer" --scope $KV_ID

#upload ssl cert to app service 2
#az webapp config ssl upload --certificate-file $ZKPYTUGCOM_CERT.pfx --certificate-password $ZKPYTUGCOM_CERT_PASSWORD --resource-group $RESOURCE_GROUP --name $APP2_NAME

#import ssl cert to app service 2 from key vault
#az webapp config ssl import --key-vault $KV_NAME --resource-group $RESOURCE_GROUP --name $APP2_NAME --key-vault-certificate-name $ZKPYTUGCOM_CERT

# create app service with vnet integration
#az webapp vnet-integration add --name $APP2_NAME --resource-group $RESOURCE_GROUP --vnet $VNET_NAME --subnet $APP2_OUTBOUND_SUBNET_NAME

# create private-endpoint with private dns for App Service 2
#az network private-endpoint create --name $APP2_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $APP2_INBOUND_SUBNET_NAME --private-connection-resource-id $app2_id --connection-name $APP2_PRIVATE_ENDPOINT_NAME --location $REGION --group-ids sites

#az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $APP2_PRIVATE_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_1 --zone-name webapp

# create storage account for Azure function
echo "Create Storage Account for Azure Function"
az storage account create --name $FUNC_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $REGION --sku Standard_LRS --kind StorageV2 --https-only true --allow-blob-public-access false --min-tls-version TLS1_2 --access-tier Hot --query id -o tsv

# create azure function premium plan
echo "Create Azure Function Premium Plan"
az functionapp plan create --name $FUNC_APP_SERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP --location $REGION --number-of-workers $FUNC_APP_SERVICE_PLAN_WORKER_COUNT --sku $FUNC_APP_SERVICE_PLAN_SKU --is-linux --min-instances $FUNC_APP_SERVICE_PLAN_WORKER_COUNT --query id -o tsv

# create app insights for Azure function with premium tier
echo "Create App Insights for Azure Function"
az monitor app-insights component create --app $FUNC_APP_INSIGHTS_NAME --location $REGION --kind web --application-type web --resource-group $RESOURCE_GROUP --retention-time 120 --query id -o tsv

# create azure function inbound subnet
echo "Create Azure Function Subnet"
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME --address-prefixes $FUNC_INBOUND_SUBNET_PREFIX

# create azure function outbound subnet
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --address-prefixes $FUNC_OUTBOUND_SUBNET_PREFIX

# create azure function with vnet integration
echo "Create Azure Function"
FUNC_ID=$(az functionapp create --name $FUNC_NAME --resource-group $RESOURCE_GROUP --plan $FUNC_APP_SERVICE_PLAN_NAME --runtime dotnet --os-type Linux --functions-version 4 --os-type Linux --runtime-version 6 --image mcr.microsoft.com/azure-functions/dotnet:latest --app-insights $FUNC_APP_INSIGHTS_NAME --storage-account $FUNC_STORAGE_ACCOUNT_NAME --query id -o tsv)

#create identity for func_id
FUNC_IDENTITY=$(az functionapp identity assign --name $FUNC_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $FUNC_IDENTITY
az role assignment create --assignee $FUNC_IDENTITY --role "Key Vault Secrets User" --scope $KV_ID
az role assignment create --assignee $FUNC_IDENTITY --role "Key Vault Reader" --scope $KV_ID
az role assignment create --assignee $FUNC_IDENTITY --role "Key Vault Certificates Officer" --scope $KV_ID
az role assignment create --assignee $FUNC_IDENTITY --role "Key Vault Secrets Officer" --scope $KV_ID
az role assignment create --assignee $FUNC_IDENTITY --role "Key Vault Crypto Officer" --scope $KV_ID

#upload ssl cert to functionapp
#az webapp config ssl upload --certificate-file $ZKPYTUGCOM_CERT.pfx --certificate-password $ZKPYTUGCOM_CERT_PASSWORD --resource-group $RESOURCE_GROUP --name $FUNC_NAME

#import ssl cert to app functionapp from key vault
az webapp config ssl import --key-vault $KV_NAME --resource-group $RESOURCE_GROUP --name $FUNC_NAME --key-vault-certificate-name $ZKPYTUGCOM_CERT

# create vnet integration for azure function
echo "Create Vnet Integration for Azure Function"
az functionapp vnet-integration add --name $FUNC_NAME --resource-group $RESOURCE_GROUP --vnet $VNET_NAME --subnet $FUNC_OUTBOUND_SUBNET_NAME

# create private-endpoint with private dns for Azure Function
az network private-endpoint create --name $FUNC_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $FUNC_INBOUND_SUBNET_NAME --private-connection-resource-id $FUNC_ID --connection-name $FUNC_ENDPOINT_NAME --location $REGION --group-ids sites
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $FUNC_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_1 --zone-name sites

az resource update -g $RESOURCE_GROUP -n $FUNC_NAME --resource-type Microsoft.Web/sites --set properties.publicNetworkAccess=Enabled

# MYSQL
# create sql subnet
echo "Create SQL Subnet"
sql_subnet_id=$(az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME --address-prefixes $SQL_SUBNET_PREFIX)

echo "Create SQL Server"
sql_server_id=$(az sql server create --name $SQL_SERVER_NAME --resource-group $RESOURCE_GROUP --location $REGION --admin-user $SQL_ADMIN_USERNAME --admin-password $SQL_ADMIN_PASSWORD --enable-public-network true --query id -o tsv)

# create sql server private end point
echo "Create SQL Private Endpoint"
az network private-endpoint create --name $SQL_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $SQL_SUBNET_NAME --private-connection-resource-id $sql_server_id --connection-name $SQL_ENDPOINT_NAME --location $REGION --group-ids sqlServer
# link private end point with private dns zone
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $SQL_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_7 --zone-name sql

echo "Create SQL Database"
# create sql database with redundancy zone with value for backup storage redundancy zone
sql_database_id=$(az sql db create --name $SQL_DATABASE_NAME --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --zone-redundant false --backup-storage-redundancy Zone --query id -o tsv)

# Add a virtual network rule
echo "Add a virtual network rule for aks"
az network vnet subnet update --name $AKS_SUBNET_NAME --vnet-name $VNET_NAME --resource-group $RESOURCE_GROUP --service-endpoints Microsoft.Sql
az sql server vnet-rule create --name AllowAKSSubnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $AKS_SUBNET_NAME --vnet-name $VNET_NAME

#echo "Add  ServiceEndpoints for Microsoft.Sql resources for App Service 1"
#az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_OUTBOUND_SUBNET_NAME --service-endpoints Microsoft.Sql

#echo "Add  ServiceEndpoints for Microsoft.Sql resources for App Service 2"
#az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_OUTBOUND_SUBNET_NAME --service-endpoints Microsoft.Sql

echo "Add  ServiceEndpoints for Microsoft.Sql resources for Azure Function"
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --service-endpoints Microsoft.Sql

echo "Add ServiceEndpoints for Microsoft.Sql resources for AKS"
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME --service-endpoints Microsoft.Sql

echo "Add a virtual network rule for app service 1"
az sql server vnet-rule create --name AllowApp1Subnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $APP1_OUTBOUND_SUBNET_NAME --vnet-name $VNET_NAME

echo "Add a virtual network rule for app service 2"
az sql server vnet-rule create --name AllowApp2Subnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $APP2_OUTBOUND_SUBNET_NAME --vnet-name $VNET_NAME

echo "Add a virtual network rule for function app"
az sql server vnet-rule create --name AllowFuncSubnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $FUNC_OUTBOUND_SUBNET_NAME --vnet-name $VNET_NAME

echo "Add a virtual network rul for aks"
az sql server vnet-rule create --name AllowAKSSubnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $AKS_SUBNET_NAME --vnet-name $VNET_NAME

# create the storage subnet
echo "Create Storage Subnet"
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $STORAGE_SUBNET_NAME --address-prefixes $STORAGE_SUBNET_PREFIX

# create a storage account
echo "Create Storage Account"
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $REGION --sku Standard_LRS --kind StorageV2 --https-only true --allow-blob-public-access false --min-tls-version TLS1_2 --access-tier Hot --query id -o tsv

# create a 5TB Azure Blob
echo "Create 5TB Azure Blob"
az storage container create --name $STORAGE_CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

# get storage account id
STORAGE_ACCOUNT_ID=$(az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)

# create a private endpoint
echo "Create Storage Private Endpoint"
az network private-endpoint create --name $STORAGE_ENDPOINT_NAME_BLOB --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $STORAGE_SUBNET_NAME --private-connection-resource-id $STORAGE_ACCOUNT_ID --connection-name $STORAGE_ENDPOINT_NAME_BLOB --location $REGION --group-ids blob
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $STORAGE_ENDPOINT_NAME_BLOB --name zone-group --private-dns-zone $DNS_ZONE_NAME_5 --zone-name blob

# create a private endpoint for fileshare
echo "Create Storage Private Endpoint for Fileshare"
az network private-endpoint create --name $STORAGE_ENDPOINT_NAME_FILESHARE --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $STORAGE_SUBNET_NAME --private-connection-resource-id $STORAGE_ACCOUNT_ID --connection-name $STORAGE_ENDPOINT_NAME_FILESHARE --location $REGION --group-ids file
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $STORAGE_ENDPOINT_NAME_FILESHARE --name zone-group --private-dns-zone $DNS_ZONE_NAME_6 --zone-name file

# create a fileshare
echo "Create Fileshare for 5T bytes"
az storage share create --name $STORAGE_SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME --quota 5120

# create nsg for aks
echo "Create NSG for AKS"
az network nsg create --name $AKS_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to aks subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME --network-security-group $AKS_NSG_NAME

# create nsg for sql
echo "Create NSG for SQL"
az network nsg create --name $SQL_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to sql subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME --network-security-group $SQL_NSG_NAME

# create nsg for storage
echo "Create NSG for Storage"
az network nsg create --name $STORAGE_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to storage subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $STORAGE_SUBNET_NAME --network-security-group $STORAGE_NSG_NAME

# create nsg for vm
echo "Create NSG for VM"
az network nsg create --name $VM_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to vm subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME --network-security-group $VM_NSG_NAME
# allow all inbound 3389
az network nsg rule create --name AllowRDP --nsg-name $VM_NSG_NAME --resource-group $RESOURCE_GROUP --access Allow --direction Inbound --priority 100 --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 3389 --protocol Tcp

# create nsg for function app inbound
echo "Create NSG for Function App Inbound"
az network nsg create --name $FUNC_APP_NSG_INBOUND --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to function app inbound subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME --network-security-group $FUNC_APP_NSG_INBOUND

# create nsg for function app outbound
echo "Create NSG for Function App Outbound"
az network nsg create --name $FUNC_APP_NSG_OUTBOUND --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to function app outbound subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --network-security-group $FUNC_APP_NSG_OUTBOUND

# create nsg for adf
echo "Create NSG for ADF"
az network nsg create --name $ADF_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to adf subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $ADF_SUBNET_NAME --network-security-group $ADF_NSG_NAME

# create nsg for app gateway
echo "Create NSG for App Gateway"
az network nsg create --name $APPGW_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to app gateway subnet
# az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME --network-security-group $APPGW_NSG_NAME
# Got error when attaching the nsg to app gateway subnet

# create nsg for misc
echo "Create NSG for Misc"
az network nsg create --name $MISC_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
# attach nsg to misc subnet
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $MISC_SUBNET_NAME --network-security-group $MISC_NSG_NAME

# create all route tables
echo "Create Route Tables"
az network route-table create --name $AKS_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $SQL_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $STORAGE_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $VM_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $FUNC_APP_ROUTE_TABLE_NAME_INBOUND --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $ADF_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
#az network route-table create --name $APPGW_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $MISC_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION

# attach route tables to subnets
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME --route-table $AKS_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME --route-table $SQL_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $STORAGE_SUBNET_NAME --route-table $STORAGE_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME --route-table $VM_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME --route-table $FUNC_APP_ROUTE_TABLE_NAME_INBOUND
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --route-table $FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $ADF_SUBNET_NAME --route-table $ADF_ROUTE_TABLE_NAME
#az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME --route-table $APPGW_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $MISC_SUBNET_NAME --route-table $MISC_ROUTE_TABLE_NAME

#create V2 data factory

echo "Create Azure Data Factory V2"
az extension add --name datafactory
ADF_ID=$(az datafactory create --name $ADF_NAME --resource-group $RESOURCE_GROUP --location $REGION --query id -o tsv)
echo "ADF_ID $ADF_ID"
az network private-endpoint create --name $ADF_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $ADF_SUBNET_NAME --private-connection-resource-id $ADF_ID --connection-name $ADF_PRIVATE_ENDPOINT_NAME --location $REGION --group-ids datafactory

#create Azure monitoring workspace
echo "Create Azure Monitoring Workspace"
AZMON_ID=$(az monitor account create --name $AZURE_MONITORING_WORKSPACE_NAME --resource-group $RESOURCE_GROUP --location $REGION --query id -o tsv)
echo "AZMON_ID $AZMON_ID"

#link AZURE_MONITORING_WORKSPACE_NAME to AKS cluster
echo "Link Azure Monitoring Workspace to AKS"
az aks update --enable-azure-monitor-metrics -n $AKS_CLUSTER_NAME -g $RESOURCE_GROUP --azure-monitor-workspace-resource-id $AZMON_ID

function nodepoolshow() {
   show --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME --name $1 --query "count"
}

function delete() {
  # delete all route tables
  echo "delete all route tables"
  az network route-table delete --name $AKS_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $SQL_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $STORAGE_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $VM_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $FUNC_APP_ROUTE_TABLE_NAME_INBOUND --resource-group $RESOURCE_GROUP
  az network route-table delete --name $FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND --resource-group $RESOURCE_GROUP
  az network route-table delete --name $ADF_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  #az network route-table delete --name $APPGW_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $MISC_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP

  # delete all nsg's
  echo "delete all nsg's"
  az network nsg delete --name $AKS_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $SQL_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $STORAGE_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $VM_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $FUNC_APP_NSG_INBOUND --resource-group $RESOURCE_GROUP
  az network nsg delete --name $FUNC_APP_NSG_OUTBOUND --resource-group $RESOURCE_GROUP
  az network nsg delete --name $ADF_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $APPGW_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $MISC_NSG_NAME --resource-group $RESOURCE_GROUP

  echo "delete AKS"
  az aks delete --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME -y

  echo "delete app gateway"
  az network application-gateway delete -n $APPGW_NAME --resource-group $RESOURCE_GROUP

  #delete app service private endpoints
  echo "delete app service private endpoints"
  az network private-endpoint delete --name $APP1_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $APP1_PRIVATE_ENDPOINT_NAME --name zone-group

  az network private-endpoint delete --name $APP2_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $APP2_PRIVATE_ENDPOINT_NAME --name zone-group

  #delete app1 identity
  echo "delete app1 identity"
  az identity delete --name $APP1_IDENTITY --resource-group $RESOURCE_GROUP

  echo "delete app service 1"
  #delete app_id1
  az webapp delete --name $APP1_NAME --resource-group $RESOURCE_GROUP

  #delete app2 identity
  echo "delete app2 identity"
  az identity delete --name $APP2_IDENTITY --resource-group $RESOURCE_GROUP

  echo "delete app service 2"
  #delete app_id2
  az webapp delete --name $APP2_NAME --resource-group $RESOURCE_GROUP

  #delete app service plan
  echo "delete app service plan"
  az appservice plan delete --name $APP_SERVICE_PLAN_NAME --resource-group $APP_SERVICE_PLAN_RESOURCE_GROUP -y

  #delete function app identity
  echo "delete function app identity"
  az identity delete --name $FUNC_IDENTITY --resource-group $RESOURCE_GROUP

  #delete function app private endpoint
  echo "delete function app private endpoint"
  az network private-endpoint delete --name $FUNC_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $FUNC_ENDPOINT_NAME --name zone-group

  #delete function app
  echo "delete function app"
  az functionapp delete --name $FUNC_NAME --resource-group $RESOURCE_GROUP
  #delete function app storage
  echo "delete function app storage"
  az storage account delete --name $FUNC_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP -y
  #delete function app insights
  echo "delete function app insights"
  az monitor app-insights component delete --app $FUNC_APP_INSIGHTS_NAME --resource-group $RESOURCE_GROUP
  #delete function app plan
  echo "delete function app plan"
  az appservice plan delete --name $FUNC_APP_SERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP -y
  #delete function app private endpoint
  echo "delete function app private endpoint"
  az network private-endpoint delete --name $FUNC_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $FUNC_ENDPOINT_NAME --name zone-group
  #delete function app subnet
  echo "delete function app subnet"
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME

  #delete database server
  echo "delete database server"
  az sql db delete --name $SQL_DATABASE_NAME --resource-group $RESOURCE_GROUP -y
  az sql server delete --name $SQL_SERVER_NAME --resource-group $RESOURCE_GROUP -y

  echo "delete app gateway public ip"
  az network application-gateway waf-policy delete -n $APPGW_WAF_POLICY_NAME -g $RESOURCE_GROUP
  az network public-ip delete -n $APPGW_PUBLIC_IP_NAME -g $RESOURCE_GROUP

  echo "delete app gateway subnet"
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME
  az identity delete --name $APPGW_NAME --resource-group $RESOURCE_GROUP

  #delete kv
  echo "delete kv"
  az keyvault delete --name $KV_NAME --resource-group $RESOURCE_GROUP
  #purge kv
  echo "purge kv"
  az keyvault purge --name $KV_NAME

  echo "delete vm"
  VM_NIC_ID=$(az vm show --name $VM_NAME --resource-group $RESOURCE_GROUP --query networkProfile.networkInterfaces[0].id -o tsv)
  VM_OSDISC_ID=$(az vm show --name $VM_NAME --resource-group $RESOURCE_GROUP --query storageProfile.osDisk.managedDisk.id -o tsv)
  az vm delete --name $VM_NAME --resource-group $RESOURCE_GROUP -y

  #delete vm nic
  echo "delete vm nic"
  az network nic delete --ids $VM_NIC_ID

  #delete vm public ip
  echo "delete vm public ip"
  az network public-ip delete --resource-group $RESOURCE_GROUP --name $VM_NAME-pip

  #delete vm disc
  echo "delete vm disc"
  az disk delete --ids $VM_OSDISC_ID -y

  #delete vm nsg
  echo "delete vm nsg"
  az network nsg delete --resource-group $RESOURCE_GROUP --name ${VM_NAME}NSG

  #delete service bus
  echo "delete service bus"
  az servicebus namespace delete --name $SB_NAME --resource-group $RESOURCE_GROUP

  #delete subnet
  echo "delete subnets"
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME
  #delete app gateway subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME
  #delete app inbound subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_INBOUND_SUBNET_NAME
  #delete app outbound subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_OUTBOUND_SUBNET_NAME
  #delete app inbound subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_INBOUND_SUBNET_NAME
  #delete app outbound subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_OUTBOUND_SUBNET_NAME
  #delete sql subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME
  #delete vm subnet
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME

  az network vnet delete --resource-group $RESOURCE_GROUP --name $VNET_NAME

  #delete storage blob
  echo "delete storage blob"
  az storage container delete --name $STORAGE_CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
  #delete storage fileshare
  echo "delete storage fileshare"
  az storage share delete --name $STORAGE_SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME
  #delete storage account
  echo "delete storage account"
  az storage account delete --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP -y

  #delete private dns link
  echo "delete private links"
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_1 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_3 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_4 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_5 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_6 --name $AKS_CLUSTER_NAME -y

  #delete private dns zone
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_1 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_2 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_3 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_4 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_5 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_6 -y

  az monitor action-group delete --name "Application Insights Smart Detection" -g $RESOURCE_GROUP
  az monitor data-collection rule delete --name MSCI-$REGION-$AKS_CLUSTER_NAME -g $RESOURCE_GROUP -y
}


