sed -i "s/uuid/$UUID/g" /etc/v2ray/config.json

cd /usr/bin/v2ray
wget --no-check-certificate -qO 'caddy.tar.gz' https://github.com/caddyserver/caddy/releases/download/v1.0.1/caddy_v1.0.1_linux_amd64.tar.gz
tar xvf caddy.tar.gz
rm -rf caddy.tar.gz
chmod 777 caddy

/usr/bin/v2ray/caddy -conf /etc/caddy/Caddyfile >/dev/null  2>&1  &

echo "Start caddy Success!"

cd /usr/bin/v2ray
wget --no-check-certificate https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
unzip v2ray-linux-64.zip v2ray v2ctl geosite.dat geoip.dat -d /usr/bin/v2ray/
rm -rf /tmp/v2ray-linux-64.zip
chmod 777 /usr/bin/v2ray/*

/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
echo "Start v2ray Success!"
