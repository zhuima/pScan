FROM golang:1.16 AS build
WORKDIR /go/src/github.com/zhuima/pscan
COPY . .
RUN VERSION=$(git describe --tags --abbrev=0) && \
    # GITCOMMIT=$(git rev-parse --short HEAD) && \
    # BUILDTIME=$(TZ=Asia/Shanghai date +%FT%T%z) && \
    # GOVERSION="1.16" && \
    CGO_ENABLED=0 go build -o bin/pscan -ldflags "-X="github.com/zhuima/pScan/cmd.version=${VERSION}
# CGO_ENABLED=0 go build -o bin/pscan -ldflags "-X="github.com/zhuima/pScan/cmd.version=${VERSION} github.com/zhuima/pScan/cmd.gitCommit=${GITCOMMIT} github.com/zhuima/pScan/cmd.buildTime=${BUILDTIME} github.com/zhuima/pScan/cmd.goVersion=${GOVERSION}


FROM alpine:3.14.2
RUN adduser -D pscan && \
    apk add --no-cache bash git openssh-client
COPY --from=build /go/src/github.com/zhuima/pscan/bin/* /usr/bin/
USER pscan
ENTRYPOINT ["pscan"]