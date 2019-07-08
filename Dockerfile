FROM alpine:latest

ENV VER=4.19.1 UUID=4890bd47-5180-4b1c-9a5d-3ef686543112

RUN apk add --no-cache --virtual .build-deps busybox bash ca-certificates wget \
 && mkdir -m 777 /etc/v2ray \
 && mkdir -m 777 /etc/caddy \
 && mkdir -m 777 /etc/caddy/www \
 && mkdir -m 777 /usr/bin/v2ray \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
 && echo "Asia/Shanghai" > /etc/timezone
 
ADD files/config.json /etc/v2ray/config.json
RUN chmod 777 /etc/v2ray/config.json
ADD files/Caddyfile /etc/caddy/Caddyfile
RUN chmod 777 /etc/caddy/Caddyfile
ADD files/index.html /etc/caddy/www/index.html
RUN chmod 777  /etc/caddy/www/index.html
ADD run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT /run.sh

EXPOSE 8080