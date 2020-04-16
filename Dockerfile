FROM alpine:latest

# Install dependencies.
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash curl openjdk8

# Install sbt binary.
ARG SBT_VERSION
RUN curl -sL "https://piccolo.link/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
    chmod 0755 /usr/local/bin/sbt

# Pre-load all available sbt versions.
ARG PROJECT_ROOT
COPY $PROJECT_ROOT sbt-preload-projects
COPY sbt-preload .
RUN ./sbt-preload sbt-preload-projects
