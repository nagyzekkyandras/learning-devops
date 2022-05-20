helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
helm search repo sonarqube
helm upgrade --install sonarqube --version 1.1.3+107 sonarqube/sonarqube