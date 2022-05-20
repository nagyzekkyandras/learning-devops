helm repo add sonatype https://sonatype.github.io/helm3-charts/
helm repo update
helm search repo nexus
helm install nexus sonatype/nexus-repository-manager

helm upgrade --install nexus -f nexus/nexus-values.yaml sonatype/nexus-repository-manager
kubectl apply -f nexus-ingress.yaml