# Golang UBI Image

## Introduction
This the Golang image with Universal Base Image 8 (UBI8)

## How to download
You can download the image from either Docker Hub or Quay
### Docker.io
```docker pull gunardysutanto/golang-ubi```
### Quay.io
```docker pull quay.io/gunardysutanto/golang-ubi```

Note: you also can download with podman by replacing docker in the pull command with podman if you feel more convinient with podman

<br/>

## How to use it for building your application
You can use the image for building your application by following the sample code below.
```
FROM gunardysutanto/golang-ubi as builder
WORKDIR /app
COPY HelloServer.go .
RUN go build -o HelloServer HelloServer.go


FROM quay.io/app-sre/ubi8-ubi-minimal
WORKDIR /hello
COPY --from=builder /app/HelloServer .
ENTRYPOINT ["./HelloServer"] 
```
