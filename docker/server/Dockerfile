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

# ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && 	tar -xvf ffmpeg-release-amd64-static.tar.xz && 	cp ./ffmpeg*-static/ffmpeg /usr/local/bin/ && 	rm -rf ffmpeg*


RUN cp /usr/share/i18n/SUPPORTED /etc/locale.gen
RUN locale-gen
RUN mkdir /home/panel
RUN chown -R www-data:www-data /home/panel
WORKDIR /home/panel
RUN chmod 777 -R /tmp && chmod o+t -R /tmp
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd pdo_mysql bcmath zip intl gettext mbstring opcache snmp soap sockets pcntl event posix mysqli calendar zip exif memcache memcached curl json
RUN apt-get update && apt-get install libevent-dev -y
RUN usermod -u 99 www-data
RUN groupmod -g 99 www-data