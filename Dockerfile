FROM alpine:latest
LABEL maintainer "Andreas Gebhardt <agebhar1@googlemail.com>"
LABEL source "https://github.com/agebhar1/rpcbind-alpine"
LABEL branch "master"

COPY Dockerfile README.md /

RUN apk add --no-cache --update --verbose bash rpcbind && \
  rm -fr /var/cache/apk /tmp /sbin/halt /sbin/poweroff /sbin/reboot

COPY run.sh /usr/bin/run.sh

RUN chmod +x /usr/bin/run.sh

ENTRYPOINT [ "/usr/bin/run.sh" ]