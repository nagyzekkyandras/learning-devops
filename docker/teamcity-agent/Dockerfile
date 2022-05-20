FROM jetbrains/teamcity-agent

# root user needed coz the docker service inside this container need this user
USER root

# update packages
RUN apt-get update && apt-get upgrade -y

# install base things
RUN apt-get install -y sudo nano zip jq

# install ci/cd tools
# kubectl latest
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# helm 3.x latest
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash