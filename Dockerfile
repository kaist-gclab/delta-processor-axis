FROM ubuntu:20.04

RUN apt-get update; apt-get install -y \
    g++ cmake

WORKDIR /var/lib/powercrust

COPY powercrust .
RUN make 

WORKDIR /data

ENTRYPOINT ["/var/lib/powercrust/powercrust"]
