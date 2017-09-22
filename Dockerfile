FROM ubuntu:xenial

RUN apt-get -y update \
    && apt-get -y install wget \
    && (cd /tmp/ && wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key && rm -f nginx_signing.key) \
    && echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx"  | tee -a /etc/apt/sources.list \
    && echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" | tee -a /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install unit \
    && unitd --version

CMD ["unitd", "--no-daemon", "--log", "/dev/stdout"]