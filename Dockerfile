FROM aprimediet/alpine-base:3.15
LABEL maintainer="<Aditya Prima> aprimediet@gmail.com"

# Install nginx
RUN apk add --update --no-cache nginx

# COPY CONFIGURATION FILES
ADD etc /etc
ADD usr /usr

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
