FROM quay.io/app-sre/ubi8-ubi-minimal:latest
LABEL maintainer="Gunardy Sutanto<gunardy.sutanto@gmail.com>"

RUN dnf install -y tar gzip \
    && curl https://go.dev/dl/go1.18.4.linux-amd64.tar.gz | tar zxC 
/usr/local \
    && mkdir -p /go/bin /go/src /go/pkg \
    && dnf clean all    

ENV GOPATH="/go"
ENV PATH=$PATH:/usr/local/go/bin
