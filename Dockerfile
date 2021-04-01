FROM php:7.0-fpm


RUN echo '*** Change UID and GID of www-data user to match host privileges ***' && \
    usermod -u 999 www-data && \
    groupmod -g 999 www-data

RUN echo '*** Install Nginx ***' && \
    apt-get update && apt-get install -y nginx && \
    rm -r /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD []
