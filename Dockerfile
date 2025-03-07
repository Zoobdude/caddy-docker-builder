FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/nginx-adapter \
    --with github.com/hairyhenderson/caddy-teapot-module@v0.0.3-0

#Proper versioning will be added later
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
