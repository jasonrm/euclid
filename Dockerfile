FROM alpine:latest

MAINTAINER Jason Richard McNeil <jason@jasonrm.net>

ENV KUBECTL_VERSION=1.3.6
ENV HOME=/home/kubectl

COPY build.sh /

RUN /bin/sh build.sh

USER kubectl

CMD ["/usr/local/bin/kubectl"]
