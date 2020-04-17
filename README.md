# sbt

[![Build Status](https://jenkins.rouly.net/buildStatus/icon?job=builds%2Fsbt-docker%2Fmaster)](https://jenkins.rouly.net/job/builds/job/sbt-docker/job/master/)

This is a docker base image with [sbt](https://www.scala-sbt.org) on Alpine linux with JDK 8.

## Usage

```
$ docker pull jrouly/sbt:x.y.z
$ docker pull jrouly/sbt:x.y.z-preloaded
```

## Supported versions

See [versions](versions).

`-preloaded` tags are images that come with every other supported sbt version pre cached.
