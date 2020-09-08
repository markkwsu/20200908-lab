#!/bin/bash

source ./statefulset-deploy.config

deploymentName=demo-xsld
deploymentManifest="./statefulset-deploy-demo-xsld.json"

MAX_REPLICAS=2
KUBERNETES_XSLD_SECRET_NAME=${deploymentName}-secret

# Verify prereqs
error=0
if ! which kubectl; then
	echo 'kubectl is not present in this environment'
	error=1
fi
if [ ! -f "${deploymentManifest}" ]; then
	echo "The deployment manifest is not present at ${deploymentManifest}"
	error=1
fi

# Exit if an error was encountered
if [ ${error} -ne 0 ]; then
	exit 1
fi

function createXSLDKubernetesSecret() {
    NotFound=$(gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 && kubectl get secret demo-xsld-secret 2>&1 | grep -c NotFound)
    if [ "$NotFound" -eq 0 ];
    then
        gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 && kubectl delete secret ${KUBERNETES_XSLD_SECRET_NAME}
    fi
    gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 && kubectl create secret generic "${KUBERNETES_XSLD_SECRET_NAME}" --from-literal=xsadminPass="${xsadminPass}" --from-literal=secretKey="${secretKey}"
}

# Deploy the manifest
function deployKubernetes() {
    gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 && kubectl apply -f "${deploymentManifest}"
}

secretKey=$xsadminPass

createXSLDKubernetesSecret
deployKubernetes
