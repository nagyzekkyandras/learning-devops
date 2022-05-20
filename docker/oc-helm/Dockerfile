FROM openshift/origin-cli:v3.11

RUN yum update -y && yum install openssl -y

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
