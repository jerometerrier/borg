FROM debian:latest
LABEL Name=borg Version=0.0.1
RUN apt-get update && apt-get install -y\
    borgbackup \
    && rm -rf /var/lib/apt/lists/*
VOLUME [ "/script" ]
ENTRYPOINT ["/script/run.sh"]

 