ARG ALPINE_VERSION=3.18

FROM aprimediet/alpine:${ALPINE_VERSION}
LABEL maintainer="<Aditya Prima> aprimediet@gmail.com"

# Install nginx and certbot
RUN apk add --update --no-cache \
    nginx openssl

# COPY CONFIGURATION FILES
ADD etc /etc
ADD usr /usr

EXPOSE 80 443
