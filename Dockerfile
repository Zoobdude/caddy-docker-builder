FROM caddy:builder AS builder

ARG MODULES
RUN echo $MODULES | xargs -n 1 -I {} echo --with {} | xargs xcaddy build

#Proper versioning will be added later
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
