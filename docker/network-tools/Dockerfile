FROM ubuntu:latest

RUN apt-get update && apt-get upgrade

RUN apt-get install netcat nmap curl mysql-client dnsutils -y

CMD [ "sh", "-c", "sleep 6000" ]