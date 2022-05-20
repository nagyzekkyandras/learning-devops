# docker image for AWS CLI

### build
```
docker build -t awscli:1.0 .
```
### configolás
Vagy `aws configure` vagy a `/root/.aws/config` és `/root/.aws/credentials` fájlokat feltöltöd a megfelelő adatokkal.

### használat
ha fel van setupéva a secret mappánk amiben aws creadentialok vannak akkor
```
docker run -v $(pwd)/secrets:/root/.aws --workdir /root/.aws --rm awscli:1.0 /bin/sh -c "
aws ecr get-login-password > /root/.aws/password.txt
"
```
ezzel legenerálja a docker-nek a jelszót hogy utána be tudjunk loginolni
```
cat secrets/password.txt | docker login --username AWS --password-stdin XXXXXXXXXXX.amazonaws.com
```