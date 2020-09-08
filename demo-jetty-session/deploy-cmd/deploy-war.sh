gcloud config set project first-demo-marksu-001

gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 \
&& kubectl apply -f /Users/marksu/Desktop/eclipse.ibm/workspace/demo-jetty-session/gke-deploy-yaml/deployment.yaml

gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 \
&& kubectl apply -f /Users/marksu/Desktop/eclipse.ibm/workspace/demo-jetty-session/gke-deploy-yaml/nodeport-service.yaml

gcloud container clusters get-credentials cluster-session-demo --region asia-east1 --project first-demo-marksu-001 \
&& kubectl apply -f /Users/marksu/Desktop/eclipse.ibm/workspace/demo-jetty-session/gke-deploy-yaml/ingress.yaml