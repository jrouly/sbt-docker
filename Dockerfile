FROM alpine:latest

ARG SBT_VERSION

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash curl openjdk8 && \
    curl -sL "https://piccolo.link/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
    chmod 0755 /usr/local/bin/sbt
