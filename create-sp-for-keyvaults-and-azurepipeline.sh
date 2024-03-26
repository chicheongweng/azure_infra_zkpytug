ENV=pdt
RESOURCE_GROUP=rg-zkpytug-rhk-ucp-${ENV}
REGION=eastasia
KV_NAME=kv-zkpytug-rhk-ucp-${ENV}-01
RESOURCE_GROUP=rg-zkpytug-rhk-ucp-${ENV}

#create service principal for keyvault

export SP_NAME_KV=svc-$KV_NAME
output=$(az ad sp create-for-rbac --name $SP_NAME_KV --year 1)
echo "output $output"
export SP_APP_ID_KV=$(echo $output | jq -r '.appId')
export SP_APP_SECRET_KV=$(echo $output | jq -r '.password')
echo "SP_NAME $SP_NAME_KV"
echo "appId $SP_APP_ID_KV"
echo "appSecret $SP_APP_SECRET_KV"

echo "setting kv policy"
az keyvault set-policy --name $KV_NAME --spn $SP_APP_ID_KV --secret-permissions get list

#remove policy assignment
#az keyvault delete-policy --name $KV_NAME --spn $SP_APP_ID_KV
#az ad sp delete --id $SP_APP_ID_KV

#create service principal for azure pipeline

export SP_NAME=svc-azure-pipeline-zkpytug-rhk-ucp-${ENV}-01
output=$(az ad sp create-for-rbac --name $SP_NAME --year 1)
echo "output $output"
export SP_APP_ID=$(echo $output | jq -r '.appId')
export SP_APP_SECRET=$(echo $output | jq -r '.password')
echo "SP_NAME $SP_NAME"
echo "appId $SP_APP_ID"
echo "appSecret $SP_APP_SECRET"

#assign prod aks contributor role to service principal
AKS_NAME=aks-zkpytug-rhk-ucp-${ENV}-01
AKS_ID=$(az aks show --name $AKS_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
echo "AKS_ID $AKS_ID"
az role assignment create --assignee $SP_APP_ID --role Contributor --scope $AKS_ID

#assign prod azure function contributor role to service principal
FUNC_NAME=function-zkpytug-rhk-ucp-${ENV}-01
FUNC_ID=$(az functionapp show --name $FUNC_NAME --resource-group $RESOURCE_GROUP --query id -o tsv)
echo "FUNC_ID $FUNC_ID"
az role assignment create --assignee $SP_APP_ID --role Contributor --scope $FUNC_ID

#list roles assigned to service principal
echo "list roles assigned to $SP_NAME $SP_APP_ID"
az role assignment list --all --assignee $SP_APP_ID --output table

#remove role assignment
#az role assignment delete --assignee $SP_APP_ID --role Contributor --scope $FUNC_ID
#az role assignment delete --assignee $SP_APP_ID --role Contributor --scope $AKS_ID
#az role assignment list --all --assignee $SP_APP_ID --output table
#az ad sp delete --id $SP_APP_ID
