sed -i "s/uuid/$UUID/g" /etc/v2ray/config.json

wget --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/caddy_install.sh && chmod +x caddy_install.sh && bash caddy_install.sh
/usr/local/caddy/caddy -conf /etc/caddy/Caddyfile >/dev/null  2>&1  &

echo "Start caddy Success!"

cd /tmp
wget --no-check-certificate https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
unzip v2ray-linux-64.zip v2ray v2ctl geosite.dat geoip.dat -d /usr/bin/v2ray/
rm -rf /tmp/v2ray-linux-64.zip
chmod +x /usr/bin/v2ray/v2ray /usr/bin/v2ray/v2ctl

/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
echo "Start v2ray Success!"
