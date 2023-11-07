# Docker deploy script for iKeyMonitor Self-hosted Standalone Server
For the full guide, please check https://support.ikeymonitor.com/hc/en-us/articles/4407987741581

# To generate a new self-signed ssl, on the host server run:
```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /root/docker-ikeymonitor-server/docker/server/apache/cert/mycert.key -out /root/docker-ikeymonitor-server/docker/server/apache/cert/mycert.crt
```
# To start the server
```
cd /root/docker-ikeymonitor-server
docker compose up -d
```
Then access the panel https://yourserver-domain-or-ip

