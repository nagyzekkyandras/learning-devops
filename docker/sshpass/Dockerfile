FROM alpine:3.12

RUN apk --update --no-cache add sshpass openssh rsync

ENTRYPOINT ["sshpass"]

CMD ["--help"]
