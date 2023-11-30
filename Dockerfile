ARG ALPINE_VERSION=3.18

FROM aprimediet/alpine:${ALPINE_VERSION}
LABEL maintainer="<Aditya Prima> aprimediet@gmail.com"

# Add user and group www-data
# RUN addgroup -g 1010 www-data
RUN adduser -u 1010 -D -H -h /usr/www -G www-data www-data
RUN adduser www-data tty

# Install nginx
RUN apk add --update --no-cache \
    nginx openssl

# COPY CONFIGURATION FILES
ADD ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./etc/nginx/proxy_params /etc/nginx/proxy_params
ADD ./etc/nginx/ssl_params /etc/nginx/ssl_params
ADD ./etc/services.d /etc/services.d
ADD ./usr /usr

RUN chown -R www-data:www-data /usr/www

EXPOSE 80 443
