FROM golang:alpine as builder
RUN apk update && apk add git
COPY . /go/src/github/alpine-docker/assume-role/
WORKDIR /go/src/github/alpine-docker/assume-role
RUN go get -u github.com/kardianos/govendor
RUN govendor init && govendor fetch +m
RUN go build -o assume-role .

FROM alpine:edge
COPY --from=builder /go/src/github/alpine-docker/assume-role/assume-role /usr/bin/assume-role
RUN chmod +x /usr/bin/assume-role

