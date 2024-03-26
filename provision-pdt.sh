ENV=pdt
RESOURCE_GROUP=rg-zkpytug-rhk-ucp-${ENV}
REGION=eastasia
VNET_NAME=vnet-zkpytug-rhk-ucp-${ENV}-01
VNET_ADDRESS_PREFIX=10.102.0.0/20

KV_NAME=kv-zkpytug-rhk-ucp-${ENV}-01
MS_AZURE_APP_SERVICE_OBJECT_ID=$(az ad sp list --all --query "[?appDisplayName=='Microsoft Azure App Service'].id" --output tsv)

AKS_CLUSTER_NAME=aks-zkpytug-rhk-ucp-${ENV}-01
AKS_SUBNET_NAME=snet-zkpytug-rhk-ucp-aks-${ENV}-01
AKS_SUBNET_PREFIX=10.102.0.0/22
AKS_SUBNET_START_IP=10.102.0.1
AKS_SUBNET_END_IP=10.102.3.254
AKS_CLUSTER_ILB_IP=10.102.3.200
SERVICE_CIDR=10.102.16.0/22
DNS_SERVICE_IP=10.102.16.10
MAX_POD_NUMBER=250
K8S_VERSION=1.28
AKS_NODECOUNT=2
AKS_NODECOUNT_MIN=2
AKS_NODECOUNT_MAX=3
AKS_SYS_NODE_VM_COMPUTESIZE=Standard_D8ds_v5
AKS_USER_NODE_VM_COMPUTESIZE=Standard_D8ds_v5
AKS_USER_NODEPOOL_NAME=userpool
AKS_USER_NODE_OS=Linux
MCRG=MC_"$RESOURCE_GROUP"_"$AKS_CLUSTER_NAME"_"$REGION"
AKS_CLUSTER_INTERNAL_DNS_NAME=rcp-k8s
AKS_CLUSTER_ILB_DNS_NAME=ilb
AKS_NSG_NAME=nsg-zkpytug-rhk-ucp-aks-${ENV}-01
AKS_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-aks-${ENV}-01


zkpytugcom_CERT=zkpytugcom
zkpytugcom_CERT_PASSWORD=password
zkpytugcom_HOSTNAMES="zkpytug.com *.zkpytug.com"

APPGW_NAME=agw-zkpytug-rhk-ucp-${ENV}-01
APPGW_IDENTITY=id-zkpytug-rhk-ucp-${ENV}-01
APPGW_PREFIX=10.102.5.0/27
APPGW_PRIVATE_IP=10.102.5.10
APPGW_SUBNET_NAME=snet-zkpytug-rhk-ucp-agw-${ENV}-01
APPGW_PUBLIC_IP_NAME=pip-agw-zkpytug-rhk-ucp-${ENV}-01
APPGW_WAF_POLICY_NAME=wafp-zkpytug-rhk-ucp-${ENV}-01
APPGW_NSG_NAME=nsg-zkpytug-rhk-ucp-agw-${ENV}-01
APPGW_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-agw-${ENV}-01





FUNC_NAME=function-zkpytug-rhk-ucp-${ENV}-01
FUNC_INBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_OUTBOUND_SUBNET_NAME=snet-zkpytug-rhk-ucp-func-${ENV}-02
FUNC_INBOUND_SUBNET_PREFIX=10.102.4.160/27
FUNC_OUTBOUND_SUBNET_PREFIX=10.102.4.192/27
FUNC_OUTBOUND_SUBNET_START_IP=10.102.4.193
FUNC_OUTBOUND_SUBNET_END_IP=10.102.4.222
FUNC_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_STORAGE_ACCOUNT_NAME=stfunczkpytugrhkucp${ENV}01
FUNC_APP_INSIGHTS_NAME=appinsights-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_APP_SERVICE_PLAN_NAME=asp-zkpytug-rhk-ucp-${ENV}-01
FUNC_APP_SERVICE_PLAN_SKU=P1V2
FUNC_APP_SERVICE_PLAN_SIZE=S1
FUNC_SERVICE_PLAN_LOCATION=eastasia
FUNC_APP_SERVICE_PLAN_WORKER_SIZE=1
FUNC_APP_SERVICE_PLAN_WORKER_COUNT=1
FUNC_APP_NSG_INBOUND=nsg-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_APP_NSG_OUTBOUND=nsg-zkpytug-rhk-ucp-func-${ENV}-02
FUNC_APP_ROUTE_TABLE_NAME_INBOUND=rt-zkpytug-rhk-ucp-func-${ENV}-01
FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND=rt-zkpytug-rhk-ucp-func-${ENV}-02

REDIS_NAME=redis-zkpytug-rhk-ucp-${ENV}-01
REDIS_SUBNET_NAME=snet-zkpytug-rhk-ucp-redis-${ENV}-01
REDIS_SUBNET_PREFIX=10.102.4.0/27
REDIS_SIZE=C2
REDIS_SKU=Standard
REDIS_REPLICATION=1
REDIS_PERSISTENCE=true
REDIS_ACCESS_KEY=secret
REDIS_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-redis-${ENV}-01
REDIS_NSG_NAME=nsg-zkpytug-rhk-ucp-redis-${ENV}-01
REDIS_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-redis-${ENV}-01

SQL_SERVER_NAME=sql-zkpytug-rhk-ucp-${ENV}-01
SQL_DATABASE_NAME=sqldb-zkpytug-rhk-ucp-${ENV}-01
SQL_ADMIN_USERNAME=sqladmin
SQL_ADMIN_PASSWORD=Password1234
SQL_SUBNET_NAME=snet-zkpytug-rhk-ucp-sql-${ENV}-01
SQL_SUBNET_PREFIX=10.102.4.32/27
SQL_NSG_NAME=nsg-zkpytug-rhk-ucp-sql-${ENV}-01
SQL_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-sql-${ENV}-01
SQL_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-sql-${ENV}-01

STORAGE_ACCOUNT_NAME=storzkpytugrhkucp${ENV}
STORAGE_SUBNET_NAME=snet-zkpytug-rhk-ucp-stor-${ENV}-01
STORAGE_SUBNET_PREFIX=10.102.4.64/27
STORAGE_CONTAINER_NAME=con01
STORAGE_BLOB_NAME=blob01
STORAGE_BLOB_FILE=blobfile01
STORAGE_SHARE_NAME=fs01
STORAGE_ENDPOINT_NAME_BLOB=pe-zkpytug-rhk-ucp-stor-blob-${ENV}-01
STORAGE_ENDPOINT_NAME_FILESHARE=pe-zkpytug-rhk-ucp-stor-fileshare-${ENV}-01
STORAGE_NSG_NAME=nsg-zkpytug-rhk-ucp-stor-${ENV}-01
STORAGE_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-stor-${ENV}-01


VM_NAME=vmucpadm${ENV}01
VM_SUBNET_NAME=snet-zkpytug-rhk-ucp-adm-${ENV}-01
VM_SUBNET_PREFIX=10.102.4.96/27
VM_NSG_NAME=nsg-zkpytug-rhk-ucp-adm-${ENV}-01
VM_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-adm-${ENV}-01
VM_SIZE=Standard_F2s_v2
VM_STATIC_IP=10.102.4.100

SB_NAME=sb-zkpytug-rhk-ucp-${ENV}-01
SB_SUBNET_NAME=snet-zkpytug-rhk-ucp-sb-${ENV}-01
SB_SUBNET_PREFIX=10.102.4.128/27

DNS_ZONE_NAME_1=privatelink.azurewebsites.net
DNS_ZONE_NAME_2=zkpytug.com
DNS_ZONE_NAME_4=privatelink.redis.cache.windows.net
DNS_ZONE_NAME_5=privatelink.blob.core.windows.net
DNS_ZONE_NAME_6=privatelink.file.core.windows.net
DNS_ZONE_NAME_7=privatelink.database.windows.net

ADF_NAME=adf-zkpytug-rhk-ucp-${ENV}-01
ADF_SUBNET_NAME=snet-zkpytug-rhk-ucp-adf-${ENV}-01
ADF_SUBNET_PREFIX=10.102.4.224/27
ADF_NSG_NAME=nsg-zkpytug-rhk-ucp-adf-${ENV}-01
ADF_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-adf-${ENV}-01
ADF_PRIVATE_ENDPOINT_NAME=pe-zkpytug-rhk-ucp-adf-${ENV}-01

MISC_SUBNET_NAME=snet-zkpytug-rhk-ucp-misc-${ENV}-01
MISC_SUBNET_PREFIX=10.102.5.32/27
MISC_NSG_NAME=nsg-zkpytug-rhk-ucp-misc-${ENV}-01
MISC_ROUTE_TABLE_NAME=rt-zkpytug-rhk-ucp-misc-${ENV}-01

LOG_ANALYTICS_WORKSPACE_NAME=log-zkpytug-rhk-ucp-${ENV}-01

APP_INSIGHTS_NAME=appi-zkpytug-rhk-ucp-${ENV}-01

ACRNAME=acrzkpytugrhkucp01
SP_APP_ID=f7a07919-8429-4aca-bb40-87bd4e1b2ca3
SP_APP_SECRET=emg8Q~1HwBR.dAoGfghhjOUdlc~auRH8fPnpgbhj

AZURE_MONITORING_WORKSPACE_NAME=azmon-zkpytug-rhk-ucp-${ENV}-01
AZURE_MONITORING_WORKSPACE_LOCATION=eastasia

echo "checking if zkpytugcom.pfx/crt/key files exist"

files=($zkpytugcom_CERT.pfx $zkpytugcom_CERT.crt $zkpytugcom_CERT.key)

for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "File $file does not exist."
        exit 1
    fi
done

echo "All files exist."

echo "Verifying the password for the PFX file"
echo "$zkpytugcom_CERT_PASSWORD" | openssl pkcs12 -info -in $zkpytugcom_CERT.pfx -nokeys -passin stdin > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Password is correct."
else
    echo "Password is incorrect."
    exit 1
fi

echo "the modulus of crt and key files are correct"
CRT_FILE=$zkpytugcom_CERT.crt
KEY_FILE=$zkpytugcom_CERT.key

CRT_MODULUS=$(openssl x509 -noout -modulus -in $CRT_FILE | openssl md5)
KEY_MODULUS=$(openssl rsa -noout -modulus -in $KEY_FILE | openssl md5)

if [ "$CRT_MODULUS" == "$KEY_MODULUS" ]; then
    echo "The modulus of the certificate and the key match."
else
    echo "The modulus of the certificate and the key do not match."
    exit 1
fi

echo "Install extensions ..."
az extension add --name aks-preview
az extension add --name application-insights
az extension add --name connectedk8s
az extension add --name datafactory
az extension add --name k8sconfiguration
az extension add --name monitor-control-service



echo "Create Resource Group"
az group create --name $RESOURCE_GROUP --location $REGION

az monitor log-analytics workspace create --resource-group $RESOURCE_GROUP --workspace-name $LOG_ANALYTICS_WORKSPACE_NAME --location $REGION

az monitor app-insights component create --app $APP_INSIGHTS_NAME --location $REGION --resource-group $RESOURCE_GROUP --application-type web --kind web --tags "env=$ENV" --workspace $LOG_ANALYTICS_WORKSPACE_NAME


echo "Create Vnet"
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME --address-prefixes $VNET_ADDRESS_PREFIX
VNET_ID=$(az network vnet show --resource-group $RESOURCE_GROUP --name $VNET_NAME --query id -o tsv)
echo $VNET_ID

az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $MISC_SUBNET_NAME --address-prefixes $MISC_SUBNET_PREFIX

az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $ADF_SUBNET_NAME --address-prefixes $ADF_SUBNET_PREFIX

az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SB_SUBNET_NAME --address-prefixes $SB_SUBNET_PREFIX


echo "Create Key Vault"
KV_ID=$(az keyvault create --name $KV_NAME --resource-group $RESOURCE_GROUP --location $REGION --query id -o tsv)
KV_ID=$(az keyvault show --name $KV_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
echo "KV_ID $KV_ID"

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $MS_AZURE_APP_SERVICE_OBJECT_ID



operator_id=$(az ad signed-in-user show --query id -o tsv)
echo "operator_id $operator_id"
echo "Set Key Vault Policy"
az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $operator_id
az role assignment create --assignee $operator_id --role "Reader" --scope $KV_ID
az role assignment create --assignee $operator_id --role "Key Vault Certificates Officer" --scope $KV_ID
az role assignment create --assignee $operator_id --role "Key Vault Secrets Officer" --scope $KV_ID
az role assignment create --assignee $operator_id --role "Key Vault Crypto Officer" --scope $KV_ID

az keyvault secret set --vault-name $KV_NAME --name ${SQL_DATABASE_NAME}-password --value ${SQL_ADMIN_PASSWORD}

az keyvault secret set --vault-name $KV_NAME --name ${REDIS_NAME}-accesskey --value ${REDIS_ACCESS_KEY}


az keyvault certificate import --vault-name $KV_NAME --name $zkpytugcom_CERT --file $zkpytugcom_CERT.pfx --password $zkpytugcom_CERT_PASSWORD

echo "Create Private DNS Zone"
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_1
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_2
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_4
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_5
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_6
az network private-dns zone create --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_7
echo "Create Private DNS Link"
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_1 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_4 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_5 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_6 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false
az network private-dns link vnet create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_7 --name $VNET_NAME --virtual-network $VNET_NAME --registration-enabled false

az network public-ip create --resource-group $RESOURCE_GROUP --name $VM_NAME-pip --sku Standard --allocation-method static --location $REGION
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME --address-prefixes $VM_SUBNET_PREFIX
az network nic create --resource-group $RESOURCE_GROUP --name $VM_NAME-nic --vnet-name $VNET_NAME --subnet $VM_SUBNET_NAME --public-ip-address $VM_NAME-pip --private-ip-address $VM_STATIC_IP
echo "Create VM"
az vm create --resource-group $RESOURCE_GROUP --name $VM_NAME --image Win2022Datacenter --admin-username azureuser --admin-password Password1234 --nics $VM_NAME-nic --size $VM_SIZE --location $REGION


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

echo "Assign Network Contributor Role of Vnet to AKS cluster"
AKS_IDENTITY_ID=$(az aks show --name $AKS_CLUSTER_NAME --resource-group $RESOURCE_GROUP --query identity.principalId -o tsv)
echo "AKS_IDENTITY_ID $AKS_IDENTITY_ID"


az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $AKS_IDENTITY_ID

az role assignment create --assignee $AKS_IDENTITY_ID --role "Network Contributor" --scope $VNET_ID


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

AKS_AGENTPOOL_SP_ID=$(az ad sp list --display-name ${AKS_CLUSTER_NAME}-agentpool --query "[0].appId" -o tsv)
echo "AKS_AGENTPOOL_SP_ID $AKS_AGENTPOOL_SP_ID"
az role assignment create --assignee $AKS_AGENTPOOL_SP_ID --role "Network Contributor" --scope $VNET_ID

AKS_AGENTPOOL_ID=$(az ad sp list --display-name ${AKS_CLUSTER_NAME}-agentpool --query "[0].id" -o tsv)
az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $AKS_AGENTPOOL_ID

echo "Get AKS Credentials"

az aks get-credentials -n $AKS_CLUSTER_NAME -g $RESOURCE_GROUP --admin --overwrite-existing

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

kubectl create secret docker-registry acr-authentication --docker-server $ACRNAME.azurecr.io  --docker-username $SP_APP_ID --docker-password $SP_APP_SECRET --docker-email emily.ym.chan@hkbn.com.hk --namespace ricoh

kubectl get secrets -n ricoh
kubectl create secret tls ingress-cert-zkpytugcom --namespace ricoh --key zkpytugcom.key --cert zkpytugcom.crt

kubectl apply -f aks-helloworld-one.yaml
kubectl apply -f aks-helloworld-two.yaml

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
kubectl apply -f ingress-hello-world-tls-production.yaml
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

az network private-dns record-set a create --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --name $AKS_CLUSTER_INTERNAL_DNS_NAME
az network private-dns record-set a add-record --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --record-set-name $AKS_CLUSTER_INTERNAL_DNS_NAME --ipv4-address $AKS_CLUSTER_ILB_IP

echo "Get service"
kubectl get service -n ingress-nginx
kubectl describe svc ingress-nginx-controller -n ingress-nginx
kubectl get ingress -n ricoh
kubectl describe ingress hello-world-ingress -n ricoh
kubectl get pods -n ricoh -o wide
kubectl get pods -n ingress-nginx
kubectl get pods -n kube-system


echo "Create App Gateway Public IP"
az network public-ip create -n $APPGW_PUBLIC_IP_NAME -g $RESOURCE_GROUP --allocation-method Static --sku Standard --zone 1 2 3

echo "Create App Gateway Subnet"
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME --address-prefixes $APPGW_PREFIX



echo "Create App Gateway"
az network application-gateway create -n $APPGW_NAME -g $RESOURCE_GROUP --sku Standard_v2 --public-ip-address $APPGW_PUBLIC_IP_NAME --private-ip-address $APPGW_PRIVATE_IP --vnet-name $VNET_NAME --subnet $APPGW_SUBNET_NAME --priority 100 --zones 1 2 3


echo "APPGW_PRIVATE_IP $APPGW_PRIVATE_IP"

APPGW_IDENTITY_ID=$(az identity create --name $APPGW_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
echo "APPGW_IDENTITY_ID $APPGW_IDENTITY_ID"

az network application-gateway identity assign -g $RESOURCE_GROUP --gateway-name $APPGW_NAME --identity $APPGW_IDENTITY_ID
APPGW_IDENTITY_PRINCIPAL_ID=$(az identity show --name $APPGW_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)
echo "APPGW_IDENTITY_PRINCIPAL_ID $APPGW_IDENTITY_PRINCIPAL_ID"

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $APPGW_IDENTITY_PRINCIPAL_ID


az network application-gateway ssl-cert create --gateway-name $APPGW_NAME --name $zkpytugcom_CERT --resource-group $RESOURCE_GROUP --key-vault-secret-id $(az keyvault secret show --vault-name $KV_NAME --name $zkpytugcom_CERT --query id -o tsv)


az network application-gateway frontend-port create --gateway-name $APPGW_NAME --name appGatewayFrontendPort443 --resource-group $RESOURCE_GROUP --port 443

APPGW_FRONTEND_IP_ID=$(az network application-gateway frontend-ip show --gateway-name $APPGW_NAME --resource-group $RESOURCE_GROUP --name appGatewayFrontendIP --query id -o tsv)

az network application-gateway http-listener create --gateway-name $APPGW_NAME --name appGatewayHttpsListenerzkpytugcom --resource-group $RESOURCE_GROUP --frontend-port appGatewayFrontendPort443 --frontend-ip $APPGW_FRONTEND_IP_ID --host-names $zkpytugcom_HOSTNAMES --ssl-cert $zkpytugcom_CERT

az network application-gateway address-pool create --gateway-name $APPGW_NAME --name appGatewayBackendPoolAKSzkpytugcom --resource-group $RESOURCE_GROUP --servers $AKS_CLUSTER_ILB_IP

az network application-gateway probe create --gateway-name $APPGW_NAME --name appGatewayBackendHealthProbezkpytugcom --resource-group $RESOURCE_GROUP --path / --protocol Https --host $AKS_CLUSTER_INTERNAL_DNS_NAME.zkpytug.com --interval 30 --timeout 30 --threshold 3

az network application-gateway http-settings create --gateway-name $APPGW_NAME --name appGatewayBackendHttpSettingszkpytugcom --resource-group $RESOURCE_GROUP --port 443 --protocol Https --cookie-based-affinity Disabled --timeout 30 --probe appGatewayBackendHealthProbezkpytugcom --host-name $AKS_CLUSTER_INTERNAL_DNS_NAME.zkpytug.com

az network application-gateway rule create --gateway-name $APPGW_NAME --name appGatewayRulezkpytugcom --resource-group $RESOURCE_GROUP --http-listener appGatewayHttpsListenerzkpytugcom --address-pool appGatewayBackendPoolAKSzkpytugcom --http-settings appGatewayBackendHttpSettingszkpytugcom --priority 190


az network application-gateway http-listener create --gateway-name $APPGW_NAME --name appGatewayHttpListenerzkpytugcom --resource-group $RESOURCE_GROUP --frontend-port appGatewayFrontendPort --frontend-ip $APPGW_FRONTEND_IP_ID --host-names $zkpytugcom_HOSTNAMES

az network application-gateway redirect-config create --gateway-name $APPGW_NAME --name appGatewayRedirectConfigzkpytugcom --resource-group $RESOURCE_GROUP --type Permanent --include-query-string true --target-listener appGatewayHttpsListenerzkpytugcom

az network application-gateway rule delete --gateway-name $APPGW_NAME --name rule1 --resource-group $RESOURCE_GROUP
az network application-gateway rule create --gateway-name $APPGW_NAME --name RedirectHttpToHttpszkpytugcom --resource-group $RESOURCE_GROUP --http-listener appGatewayHttpListenerzkpytugcom --redirect-config appGatewayRedirectConfigzkpytugcom --priority 290























echo "Create Storage Account for Azure Function"
az storage account create --name $FUNC_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $REGION --sku Standard_LRS --kind StorageV2 --https-only true --allow-blob-public-access false --min-tls-version TLS1_2 --access-tier Hot --query id -o tsv

echo "Create Azure Function Premium Plan"
az functionapp plan create --name $FUNC_APP_SERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP --location $REGION --number-of-workers $FUNC_APP_SERVICE_PLAN_WORKER_COUNT --sku $FUNC_APP_SERVICE_PLAN_SKU --is-linux --min-instances $FUNC_APP_SERVICE_PLAN_WORKER_COUNT --query id -o tsv

echo "Create App Insights for Azure Function"
az monitor app-insights component create --app $FUNC_APP_INSIGHTS_NAME --location $REGION --kind web --application-type web --resource-group $RESOURCE_GROUP --retention-time 120 --query id -o tsv

echo "Create Azure Function Subnet"
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME --address-prefixes $FUNC_INBOUND_SUBNET_PREFIX

az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --address-prefixes $FUNC_OUTBOUND_SUBNET_PREFIX

echo "Create Azure Function"
FUNC_ID=$(az functionapp create --name $FUNC_NAME --resource-group $RESOURCE_GROUP --plan $FUNC_APP_SERVICE_PLAN_NAME --runtime dotnet --os-type Linux --functions-version 4 --os-type Linux --runtime-version 6 --image mcr.microsoft.com/azure-functions/dotnet:latest --app-insights $FUNC_APP_INSIGHTS_NAME --storage-account $FUNC_STORAGE_ACCOUNT_NAME --query id -o tsv)

FUNC_IDENTITY=$(az functionapp identity assign --name $FUNC_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)

az keyvault set-policy --name $KV_NAME --resource-group $RESOURCE_GROUP --secret-permissions all --certificate-permissions all --key-permissions all --object-id $FUNC_IDENTITY



echo "Create Vnet Integration for Azure Function"
az functionapp vnet-integration add --name $FUNC_NAME --resource-group $RESOURCE_GROUP --vnet $VNET_NAME --subnet $FUNC_OUTBOUND_SUBNET_NAME

az network private-endpoint create --name $FUNC_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $FUNC_INBOUND_SUBNET_NAME --private-connection-resource-id $FUNC_ID --connection-name $FUNC_ENDPOINT_NAME --location $REGION --group-ids sites
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $FUNC_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_1 --zone-name sites

az resource update -g $RESOURCE_GROUP -n $FUNC_NAME --resource-type Microsoft.Web/sites --set properties.publicNetworkAccess=Enabled

echo "Create SQL Subnet"
sql_subnet_id=$(az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME --address-prefixes $SQL_SUBNET_PREFIX)

echo "Create SQL Server"
sql_server_id=$(az sql server create --name $SQL_SERVER_NAME --resource-group $RESOURCE_GROUP --location $REGION --admin-user $SQL_ADMIN_USERNAME --admin-password $SQL_ADMIN_PASSWORD --enable-public-network true --query id -o tsv)

echo "Create SQL Private Endpoint"
az network private-endpoint create --name $SQL_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $SQL_SUBNET_NAME --private-connection-resource-id $sql_server_id --connection-name $SQL_ENDPOINT_NAME --location $REGION --group-ids sqlServer
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $SQL_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_7 --zone-name sql

echo "Create SQL Database"
sql_database_id=$(az sql db create --name $SQL_DATABASE_NAME --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --zone-redundant false --backup-storage-redundancy Zone --query id -o tsv)

echo "Add a virtual network rule for aks"
az network vnet subnet update --name $AKS_SUBNET_NAME --vnet-name $VNET_NAME --resource-group $RESOURCE_GROUP --service-endpoints Microsoft.Sql
az sql server vnet-rule create --name AllowAKSSubnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $AKS_SUBNET_NAME --vnet-name $VNET_NAME



echo "Add  ServiceEndpoints for Microsoft.Sql resources for Azure Function"
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --service-endpoints Microsoft.Sql

echo "Add ServiceEndpoints for Microsoft.Sql resources for AKS"
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME --service-endpoints Microsoft.Sql



echo "Add a virtual network rule for function app"
az sql server vnet-rule create --name AllowFuncSubnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $FUNC_OUTBOUND_SUBNET_NAME --vnet-name $VNET_NAME

echo "Add a virtual network rule for aks"
az sql server vnet-rule create --name AllowAKSSubnet --resource-group $RESOURCE_GROUP --server $SQL_SERVER_NAME --subnet $AKS_SUBNET_NAME --vnet-name $VNET_NAME

echo "Create Redis Subnet"
REDIS_SUBNET_ID=$(az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $REDIS_SUBNET_NAME --address-prefixes $REDIS_SUBNET_PREFIX --query id -o tsv)

echo "Create Redis"
redis_id=$(az redis create --name $REDIS_NAME --resource-group $RESOURCE_GROUP --location $REGION --sku $REDIS_SKU --vm-size $REDIS_SIZE --query id -o tsv)
echo $redis_id

echo "Add a redis firewall rule for aks"
az redis firewall-rules create --name $REDIS_NAME --rule-name AllowAKSSubnet --resource-group $RESOURCE_GROUP --start-ip $AKS_SUBNET_START_IP --end-ip $AKS_SUBNET_END_IP



echo "Add a redis firewall rule for function app"
az redis firewall-rules create --name $REDIS_NAME --rule-name AllowFuncSubnet --resource-group $RESOURCE_GROUP --start-ip $FUNC_OUTBOUND_SUBNET_START_IP --end-ip $FUNC_OUTBOUND_SUBNET_END_IP

echo "Create Redis Private Endpoint"
az network private-endpoint create --name $REDIS_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $REDIS_SUBNET_NAME --private-connection-resource-id $redis_id --connection-name $REDIS_ENDPOINT_NAME --location $REGION --group-ids redisCache

az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $REDIS_ENDPOINT_NAME --name zone-group --private-dns-zone $DNS_ZONE_NAME_4 --zone-name sites

az resource update -g $RESOURCE_GROUP -n $REDIS_NAME --resource-type Microsoft.Cache/redis --set properties.publicNetworkAccess=Enabled

redis_access_key=$(az redis list-keys --name $REDIS_NAME --resource-group $RESOURCE_GROUP --query primaryKey -o tsv)
echo $redis_access_key
az keyvault secret set --name ${REDIS_NAME}-accesskey --vault-name $KV_NAME --value $redis_access_key

echo "Create Storage Subnet"
az network vnet subnet create -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $STORAGE_SUBNET_NAME --address-prefixes $STORAGE_SUBNET_PREFIX

echo "Create Storage Account"
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $REGION --sku Standard_LRS --kind StorageV2 --https-only true --allow-blob-public-access false --min-tls-version TLS1_2 --access-tier Hot --query id -o tsv

echo "Create 5TB Azure Blob"
az storage container create --name $STORAGE_CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

STORAGE_ACCOUNT_ID=$(az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)

echo "Create Storage Private Endpoint"
az network private-endpoint create --name $STORAGE_ENDPOINT_NAME_BLOB --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $STORAGE_SUBNET_NAME --private-connection-resource-id $STORAGE_ACCOUNT_ID --connection-name $STORAGE_ENDPOINT_NAME_BLOB --location $REGION --group-ids blob
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $STORAGE_ENDPOINT_NAME_BLOB --name zone-group --private-dns-zone $DNS_ZONE_NAME_5 --zone-name blob

echo "Create Storage Private Endpoint for Fileshare"
az network private-endpoint create --name $STORAGE_ENDPOINT_NAME_FILESHARE --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $STORAGE_SUBNET_NAME --private-connection-resource-id $STORAGE_ACCOUNT_ID --connection-name $STORAGE_ENDPOINT_NAME_FILESHARE --location $REGION --group-ids file
az network private-endpoint dns-zone-group create --resource-group $RESOURCE_GROUP --endpoint-name $STORAGE_ENDPOINT_NAME_FILESHARE --name zone-group --private-dns-zone $DNS_ZONE_NAME_6 --zone-name file

echo "Create Fileshare for 5T bytes"
az storage share create --name $STORAGE_SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME --quota 5120

echo "Create NSG for AKS"
az network nsg create --name $AKS_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME --network-security-group $AKS_NSG_NAME

echo "Create NSG for Redis"
az network nsg create --name $REDIS_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $REDIS_SUBNET_NAME --network-security-group $REDIS_NSG_NAME

echo "Create NSG for SQL"
az network nsg create --name $SQL_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME --network-security-group $SQL_NSG_NAME

echo "Create NSG for Storage"
az network nsg create --name $STORAGE_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $STORAGE_SUBNET_NAME --network-security-group $STORAGE_NSG_NAME

echo "Create NSG for VM"
az network nsg create --name $VM_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME --network-security-group $VM_NSG_NAME
az network nsg rule create --name AllowRDP --nsg-name $VM_NSG_NAME --resource-group $RESOURCE_GROUP --access Allow --direction Inbound --priority 100 --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 3389 --protocol Tcp

echo "Create NSG for Function App Inbound"
az network nsg create --name $FUNC_APP_NSG_INBOUND --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME --network-security-group $FUNC_APP_NSG_INBOUND

echo "Create NSG for Function App Outbound"
az network nsg create --name $FUNC_APP_NSG_OUTBOUND --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --network-security-group $FUNC_APP_NSG_OUTBOUND

echo "Create NSG for ADF"
az network nsg create --name $ADF_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $ADF_SUBNET_NAME --network-security-group $ADF_NSG_NAME

echo "Create NSG for App Gateway"
az network nsg create --name $APPGW_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION

echo "Create NSG for Misc"
az network nsg create --name $MISC_NSG_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $MISC_SUBNET_NAME --network-security-group $MISC_NSG_NAME

echo "Create Route Tables"
az network route-table create --name $AKS_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $REDIS_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $SQL_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $STORAGE_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $VM_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $FUNC_APP_ROUTE_TABLE_NAME_INBOUND --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $ADF_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION
az network route-table create --name $MISC_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP --location $REGION

az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME --route-table $AKS_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $REDIS_SUBNET_NAME --route-table $REDIS_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME --route-table $SQL_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $STORAGE_SUBNET_NAME --route-table $STORAGE_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME --route-table $VM_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME --route-table $FUNC_APP_ROUTE_TABLE_NAME_INBOUND
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME --route-table $FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $ADF_SUBNET_NAME --route-table $ADF_ROUTE_TABLE_NAME
az network vnet subnet update -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $MISC_SUBNET_NAME --route-table $MISC_ROUTE_TABLE_NAME


echo "Create Azure Data Factory V2"
az extension add --name datafactory
ADF_ID=$(az datafactory create --name $ADF_NAME --resource-group $RESOURCE_GROUP --location $REGION --query id -o tsv)
echo "ADF_ID $ADF_ID"
az network private-endpoint create --name $ADF_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --subnet $ADF_SUBNET_NAME --private-connection-resource-id $ADF_ID --connection-name $ADF_PRIVATE_ENDPOINT_NAME --location $REGION --group-ids datafactory

echo "Create Azure Monitoring Workspace"
AZMON_ID=$(az monitor account create --name $AZURE_MONITORING_WORKSPACE_NAME --resource-group $RESOURCE_GROUP --location $REGION --query id -o tsv)
echo "AZMON_ID $AZMON_ID"

echo "Link Azure Monitoring Workspace to AKS"
az aks update --enable-azure-monitor-metrics -n $AKS_CLUSTER_NAME -g $RESOURCE_GROUP --azure-monitor-workspace-resource-id $AZMON_ID


function nodepoolshow() {
   show --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME --name $1 --query "count"
}

function delete() {
  echo "delete all route tables"
  az network route-table delete --name $AKS_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $REDIS_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $SQL_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $STORAGE_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $VM_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $FUNC_APP_ROUTE_TABLE_NAME_INBOUND --resource-group $RESOURCE_GROUP
  az network route-table delete --name $FUNC_APP_ROUTE_TABLE_NAME_OUTBOUND --resource-group $RESOURCE_GROUP
  az network route-table delete --name $ADF_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP
  az network route-table delete --name $MISC_ROUTE_TABLE_NAME --resource-group $RESOURCE_GROUP

  echo "delete all nsg's"
  az network nsg delete --name $AKS_NSG_NAME --resource-group $RESOURCE_GROUP
  az network nsg delete --name $REDIS_NSG_NAME --resource-group $RESOURCE_GROUP
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

  echo "delete app service private endpoints"
  az network private-endpoint delete --name $APP1_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $APP1_PRIVATE_ENDPOINT_NAME --name zone-group

  az network private-endpoint delete --name $APP2_PRIVATE_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $APP2_PRIVATE_ENDPOINT_NAME --name zone-group

  echo "delete app1 identity"
  az identity delete --name $APP1_IDENTITY --resource-group $RESOURCE_GROUP

  echo "delete app service 1"
  az webapp delete --name $APP1_NAME --resource-group $RESOURCE_GROUP

  echo "delete app2 identity"
  az identity delete --name $APP2_IDENTITY --resource-group $RESOURCE_GROUP

  echo "delete app service 2"
  az webapp delete --name $APP2_NAME --resource-group $RESOURCE_GROUP

  echo "delete app service plan"
  az appservice plan delete --name $APP_SERVICE_PLAN_NAME --resource-group $APP_SERVICE_PLAN_RESOURCE_GROUP -y

  echo "delete function app identity"
  az identity delete --name $FUNC_IDENTITY --resource-group $RESOURCE_GROUP

  echo "delete function app private endpoint"
  az network private-endpoint delete --name $FUNC_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $FUNC_ENDPOINT_NAME --name zone-group

  echo "delete function app"
  az functionapp delete --name $FUNC_NAME --resource-group $RESOURCE_GROUP
  echo "delete function app storage"
  az storage account delete --name $FUNC_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP -y
  echo "delete function app insights"
  az monitor app-insights component delete --app $FUNC_APP_INSIGHTS_NAME --resource-group $RESOURCE_GROUP
  echo "delete function app plan"
  az appservice plan delete --name $FUNC_APP_SERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP -y
  echo "delete function app private endpoint"
  az network private-endpoint delete --name $FUNC_ENDPOINT_NAME --resource-group $RESOURCE_GROUP
  az network private-endpoint dns-zone-group delete --resource-group $RESOURCE_GROUP --endpoint-name $FUNC_ENDPOINT_NAME --name zone-group
  echo "delete function app subnet"
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_INBOUND_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $FUNC_OUTBOUND_SUBNET_NAME

  echo "delete redis"
  az redis delete --name $REDIS_NAME --resource-group $RESOURCE_GROUP -y

  echo "delete database server"
  az sql db delete --name $SQL_DATABASE_NAME --resource-group $RESOURCE_GROUP -y
  az sql server delete --name $SQL_SERVER_NAME --resource-group $RESOURCE_GROUP -y

  echo "delete app gateway public ip"
  az network application-gateway waf-policy delete -n $APPGW_WAF_POLICY_NAME -g $RESOURCE_GROUP
  az network public-ip delete -n $APPGW_PUBLIC_IP_NAME -g $RESOURCE_GROUP

  echo "delete app gateway subnet"
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME
  az identity delete --name $APPGW_NAME --resource-group $RESOURCE_GROUP

  echo "delete kv"
  az keyvault delete --name $KV_NAME --resource-group $RESOURCE_GROUP
  echo "purge kv"
  az keyvault purge --name $KV_NAME

  echo "delete vm"
  VM_NIC_ID=$(az vm show --name $VM_NAME --resource-group $RESOURCE_GROUP --query networkProfile.networkInterfaces[0].id -o tsv)
  VM_OSDISC_ID=$(az vm show --name $VM_NAME --resource-group $RESOURCE_GROUP --query storageProfile.osDisk.managedDisk.id -o tsv)
  az vm delete --name $VM_NAME --resource-group $RESOURCE_GROUP -y

  echo "delete vm nic"
  az network nic delete --ids $VM_NIC_ID

  echo "delete vm public ip"
  az network public-ip delete --resource-group $RESOURCE_GROUP --name $VM_NAME-pip

  echo "delete vm disc"
  az disk delete --ids $VM_OSDISC_ID -y

  echo "delete vm nsg"
  az network nsg delete --resource-group $RESOURCE_GROUP --name ${VM_NAME}NSG

  echo "delete service bus"
  az servicebus namespace delete --name $SB_NAME --resource-group $RESOURCE_GROUP

  echo "delete subnets"
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $AKS_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APPGW_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_INBOUND_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP1_OUTBOUND_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_INBOUND_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $APP2_OUTBOUND_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $REDIS_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $SQL_SUBNET_NAME
  az network vnet subnet delete -g $RESOURCE_GROUP --vnet-name $VNET_NAME -n $VM_SUBNET_NAME

  az network vnet delete --resource-group $RESOURCE_GROUP --name $VNET_NAME

  echo "delete storage blob"
  az storage container delete --name $STORAGE_CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
  echo "delete storage fileshare"
  az storage share delete --name $STORAGE_SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME
  echo "delete storage account"
  az storage account delete --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP -y

  echo "delete private links"
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_1 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_2 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_4 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_5 --name $AKS_CLUSTER_NAME -y
  az network private-dns link vnet delete --resource-group $RESOURCE_GROUP --zone-name $DNS_ZONE_NAME_6 --name $AKS_CLUSTER_NAME -y

  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_1 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_2 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_4 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_5 -y
  az network private-dns zone delete --resource-group $RESOURCE_GROUP --name $DNS_ZONE_NAME_6 -y

  az monitor action-group delete --name "Application Insights Smart Detection" -g $RESOURCE_GROUP
  az monitor data-collection rule delete --name MSCI-$REGION-$AKS_CLUSTER_NAME -g $RESOURCE_GROUP -y
}


