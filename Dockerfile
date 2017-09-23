FROM ubuntu:xenial

RUN set -xe \
    && apt-get -y update \
    && apt-get -y install --no-install-recommends curl php \
    && curl http://nginx.org/keys/nginx_signing.key | apt-key add - \
    && echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx"  | tee -a /etc/apt/sources.list \
    && echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" | tee -a /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install unit \
    && unitd --version

WORKDIR /www/laravel

COPY ./src /www/laravel

RUN chown -R www-data:www-data /www/laravel/storage /www/laravel/bootstrap

CMD ["unitd", "--no-daemon"]
