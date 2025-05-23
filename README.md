# Caddy Docker Builder

Caddy has [many modules available](https://caddyserver.com/docs/modules/) which can be used to extend the default functionality.
Caddy offers an [official Docker container](https://hub.docker.com/_/caddy) with a small set of default modules.
If you wish to add one of these modules, it must be set at build time and compiled using [xcaddy](https://github.com/caddyserver/xcaddy).

This GitHub Action provides an easy way to build a Caddy container yourself with your own choice of modules which is then pushed to the Docker Hub.

## Usage
Here are the required/available inputs:
https://github.com/Zoobdude/caddy-docker-builder/blob/29e5e319dc340964241e670a5f81fdf9dbffd656/action.yaml#L8-L33

Here is an example workflow file:
```
on:
  workflow_dispatch:

jobs:
  build_container:
    runs-on: ubuntu-latest
    name: Build container
    steps:
      - uses: actions/checkout@v4
      - id: builder
        uses: Zoobdude/caddy-docker-builder@v1
        with:
          modules: |
            github.com/caddy-dns/cloudflare
            github.com/porech/caddy-maxmind-geolocation
          docker-username: "zoobdude"
          docker-password: ${{ secrets.DOCKERHUB_TOKEN }}
          image: "zoobdude/caddy"
          platforms: linux/amd64,linux/arm64,linux/arm/v7
```
I have this triggering in [another repository](https://github.com/Zoobdude/caddy-builder-with-modules) to build my own container

