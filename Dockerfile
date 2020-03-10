FROM golang:alpine AS builder
RUN apk add git
RUN go get github.com/yannh/redis-dump-go
RUN cd ${GOPATH}/src/github.com/yannh/redis-dump-go && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM redis:5-alpine
RUN apk update && apk --no-cache add  ca-certificates stunnel
WORKDIR /root/
COPY --from=builder //go/src/github.com/yannh/redis-dump-go/app /bin/redis-dump
CMD ["bash"]  