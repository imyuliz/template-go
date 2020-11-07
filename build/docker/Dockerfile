# base: https://juejin.im/post/6844904174396637197
# base: https://gocn.vip/topics/10359
FROM golang:1.14-alpine as builder
WORKDIR /usr/src/app
ENV GOPROXY=https://goproxy.cn
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
  apk add --no-cache upx ca-certificates tzdata
# COPY go.mod ./
# COPY go.sum ./
# COPY Makefile ./
# RUN go mod download
COPY . .
RUN make build-min-docker

FROM scratch as server
COPY --from=builder /usr/src/app/build/docker/Dockerfile /opt/app/Dockerfile
COPY --from=builder /usr/src/app/manifest /opt/app/manifest
COPY --from=builder /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /usr/src/app/bin/server /opt/app/
CMD ["/opt/app/server"]


