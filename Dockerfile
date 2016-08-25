FROM ubuntu:14.04

MAINTAINER Xiaoming Wang, xiaoming.wang@lexisnexis.com
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nfs-kernel-server --fix-missing
RUN mkdir -p /exports

EXPOSE 111/tcp 111/udp 2049/tcp

ADD run_nfs.sh /usr/local/bin/run_nfs.sh
ENTRYPOINT ["run_nfs.sh", "/exports"]
