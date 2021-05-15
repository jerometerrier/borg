FROM debian:latest
LABEL name=borg Version=3
LABEL maintainer="jerome+dev@jelosat.com"
LABEL build_date ="2021/05/15"
RUN apt-get update && apt-get install -y\
    borgbackup \
    sshfs \
    openvpn \
    && rm -rf /var/lib/apt/lists/*

 