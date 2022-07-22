FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
LABEL maintainer="Gunardy Sutanto<gunardy.sutanto@gmail.com>"

RUN microdnf install -y tar gzip wget \
    && cd /usr/local \
    && wget https://go.dev/dl/go1.18.4.linux-amd64.tar.gz \
    && tar -xzvf go1.18.4.linux-amd64.tar.gz \
    && rm go1.18.4.linux-amd64.tar.gz \
    && mkdir -p /go/bin /go/src /go/pkg \
    && microdnf remove tar gzip wget \
    && microdnf clean all    

ENV GOPATH="/go"
ENV PATH=$PATH:/usr/local/go/bin

