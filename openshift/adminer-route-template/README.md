# Adminer install with HELM

```sh
helm repo add cetic https://cetic.github.io/helm-charts
helm repo ls
helm repo update
helm install adminer cetic/adminer -f ./adminer-route-template/helm-values.yaml
```