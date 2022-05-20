FROM alpine:3.13
RUN apk --no-cache add vsftpd
RUN apk update && apk upgrade --update-cache --available

COPY init.sh /bin/init.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

WORKDIR /ftp

ENTRYPOINT ["/bin/init.sh"]

