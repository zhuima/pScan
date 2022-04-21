FROM alpine:3.14.2 as alpine

ARG RELEASE_VERSION=latest

RUN adduser -D pscan && \
    apk add --no-cache bash git openssh-client

RUN  cd /tmp && mkdir /tmp/pscantemp && curl -sL https://api.github.com/repos/zhuima/pScan/releases/latest | sed -nE 's!.*"([^"]*Linux_x86_64.tar.gz)".*!\1!p' |tail -n1 | xargs -n1 wget -O - -q | tar -xz --strip-components=1 -C /tmp/pscantemp &&  \
    mv /tmp/pscantemp/pscan /bin/pscan && \
    chmod +x /bin/pscan

USER pscan
ENTRYPOINT ["pscan"]