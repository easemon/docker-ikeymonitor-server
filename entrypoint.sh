#!/bin/bash

# Replace placeholders in panel.conf with the SERVER_NAME environment variable
sed -i "s/.*ServerName.*/ServerName ${SERVER_NAME}/g" /etc/apache2/sites-enabled/panel.conf
# Start Apache
apache2-foreground
