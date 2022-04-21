FROM alpine:3.14.2

ARG RELEASE_VERSION=latest

RUN adduser -D pscan && \
    apk add --no-cache bash git curl wget openssh-client

RUN cd /tmp &&  mkdir /tmp/pscantemp && \
    curl -s -L https://github.com/zhuima/pScan/releases/latest | sed -nE 's!.*"([^"]*Linux_x86_64.tar.gz)".*!https://github.com\1!p' | tail -n1 | xargs -n1 wget -O - -q | tar -xz --strip-components=1 -C /tmp/pscantemp &&   \
    mv /tmp/pscantemp/pscan /bin/pscan &&   \
    chmod +x /bin/pscan


USER pscan
ENTRYPOINT ["pscan"]


