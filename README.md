nginx-spa
===
[![GitHub Release](https://img.shields.io/github/v/tag/timo-reymann/nginx-spa.svg?label=version)](https://github.com/timo-reymann/nginx-spa/releases)
[![DockerHub](https://img.shields.io/docker/pulls/timoreymann/nginx-spa)](https://hub.docker.com/r/timoreymann/nginx-spa)
[![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)

This is a really simple docker image to run your spa via docker without any configuration.


## Usage

Mount or build your files under `/app`, the container is running under `1002:1002` as unprivileged container on port `8080`.

