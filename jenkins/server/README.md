# Jenkins with helm
```sh
# helm repo add
helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm search repo jenkinsci

# pvc creation
kubectl apply -f jenkins-volume.yaml

# helm install
helm install jenkins -f jenkins-values.yaml jenkinsci/jenkins

# get the admin pw
echo $(kubectl get secret jenkins -o jsonpath={.data.jenkins-admin-password} | base64 --decode)

# create ingress for the web ui
k apply -f jenkins-ingress.yaml
```