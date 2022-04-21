FROM alpine:3.14.2 as alpine

ARG RELEASE_VERSION=latest

RUN adduser -D pscan && \
    apk add --no-cache bash git openssh-client

RUN curl -s -L https://github.com/zhuima/pScan/releases/latest | sed -nE 's!.*"([^"]*Linux_x86_64.tar.gz)".*!https://github.com\1!p' | xargs -n 1 curl -L -o /tmp/pscan.tar.gz &&  \
    tar -xzf /tmp/pscan.tar.gz -C /tmp && \
    mv /tmp/pscan /bin/pscan && \
    chmod +x /bin/pscan

USER pscan
ENTRYPOINT ["pscan"]