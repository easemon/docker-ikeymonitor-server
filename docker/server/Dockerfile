FROM php:7.4-apache

RUN apt-get update && apt-get install -y wget git unzip zip curl locales

# apache stuff

RUN a2enmod expires
RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod ssl headers
RUN a2enmod deflate

# Copy the entrypoint script into the container
COPY ./entrypoint.sh /usr/local/bin/

# Copy your Apache configuration file (assuming it's named panel.conf)
COPY ./docker/server/apache/sites-enabled/panel.conf /etc/apache2/sites-enabled/panel.conf

# Set executable permissions for the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint script as the entry point to start the container
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && 	tar -xvf ffmpeg-release-amd64-static.tar.xz && 	cp ./ffmpeg*-static/ffmpeg /usr/local/bin/ && 	rm -rf ffmpeg*


RUN cp /usr/share/i18n/SUPPORTED /etc/locale.gen
RUN locale-gen
RUN mkdir /home/panel
RUN chown -R www-data:www-data /home/panel
WORKDIR /home/panel
RUN chmod 777 -R /tmp && chmod o+t -R /tmp
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
# ioncube loader
RUN curl -o ioncube.tar.gz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvvzf ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_7.4.so `php-config --extension-dir` \
    && rm -Rf ioncube.tar.gz ioncube \
    && docker-php-ext-enable ioncube_loader_lin_7.4
RUN install-php-extensions gd pdo_mysql bcmath zip intl gettext mbstring opcache snmp soap sockets pcntl event posix mysqli calendar zip exif memcache memcached curl json
RUN apt-get update && apt-get install libevent-dev -y
RUN usermod -u 99 www-data
RUN groupmod -g 99 www-data
