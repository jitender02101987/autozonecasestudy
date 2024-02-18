This folder contains solution for creation running an application in GKE cluster using kustomize

Pre-requisities for Cluster setup:
1. Install gcloud
2. Create Project i.e. "autozonecasestudy" in GCP.
3. Create GKE cluster either standard or Auto-Pilot with Anthos Service Mesh Enabled
4. Install kubectl if not present using gcloud components install kubectl
5. Set Project id using: gcloud config set project PROJECT_ID
6. Login to cluster using gcloud container clusters get-credentials CLUSTER_NAME --region=COMPUTE_REGION

Execution Steps:

1. (OPTIONAL) Create certs if you dont have any dummy using: openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
2. Docker Image Creation:

docker build -t simple-https-app . 
docker tag simple-https-app jitender1987/autozonecasestudy:latest 
docker push jitender1987/autozonecasestudy:latest

3. Enable service mesh in namespace

kubectl label namespace default istio-injection=enabled --overwrite


4. Deployment of application using kustomize:

kubectl create secret generic my-tls-secret --from-file=cert.pem --from-file=key.pem
cd kustomize
kubectl apply -k .

5. Deployment deletion using kubectl delete -k .


Verification Steps:

1. Application Up and running via launching <Load Balancer URL>:5000/health

2. Checking health probes

Startup probe: <Load Balancer URL>:5000/health/startup
Screenshot

Liveness probe: <Load Balancer URL>:5000/health/liveness
Screenshot

Readiness probe: <Load Balancer URL>:5000/health/readiness
Screenshot

3. Workload Dashboard:

4. Service mess dashboard:


Logs:

1. Apply logs:

C:\Users\LENOVO\Desktop\autozonecasestudy\Solution1-2\kustomize>kubectl apply -k .
service/simple-https-app-service created
persistentvolume/simple-https-app-pv created
persistentvolumeclaim/simple-https-app-pvc created
deployment.apps/simple-https-app created
poddisruptionbudget.policy/simple-https-app-pdb created


2. Delete logs:

C:\Users\LENOVO\Desktop\autozonecasestudy\Solution1-2\kustomize>kubectl delete -k .
service "simple-https-app-service" deleted
persistentvolume "simple-https-app-pv" deleted
persistentvolumeclaim "simple-https-app-pvc" deleted
deployment.apps "simple-https-app" deleted
poddisruptionbudget.policy "simple-https-app-pdb" deleted
