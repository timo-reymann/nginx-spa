nginx-spa
===
[![GitHub Release](https://img.shields.io/github/v/tag/timo-reymann/nginx-spa.svg?label=version)](https://github.com/timo-reymann/nginx-spa/releases)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/timoreymann/nginx-spa)](https://hub.docker.com/r/timoreymann/nginx-spa/builds)

This is a really simple docker image to run your spa via docker without any configuration.

## Usage
Mount or build your files under `/app`, the container is running under `1002:1002` as unprivileged container on port `8080`.
