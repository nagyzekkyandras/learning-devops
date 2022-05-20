FROM alpine:latest

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*

RUN aws --version   # Just to make sure its installed alright
# Should output aws-cli/1.18.69 etc.

RUN mkdir /root/.aws # make the default folder