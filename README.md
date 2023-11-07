# Docker deploy script for iKeyMonitor Self-hosted Standalone Server
# To start the server
cd /root/docker-panel-local
docker-compose up -d

# To generate a new self-signed ssl, on the host server run:
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /root/docker-panel-local/docker/server/apache/cert/mycert.key -out /root/docker-panel-local/docker/server/apache/cert/mycert.crt

