FROM php:7-fpm

RUN apt-get update -y && apt-get install -y nginx

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/site.conf /etc/nginx/sites-enabled/default
COPY config/entrypoint.sh /etc/entrypoint.sh

RUN mkdir /app
RUN mkdir /app/uploads
RUN chown -R www-data /app/uploads
COPY --chown=www-data:www-data app/ /app/
WORKDIR /app
VOLUME /app

EXPOSE 8123

ENTRYPOINT ["sh", "/etc/entrypoint.sh"]


