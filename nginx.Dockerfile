FROM nginx:latest

EXPOSE 8080

COPY index.html /usr/share/nginx/html/index.html

COPY docker/default.conf /etc/nginx/conf.d/default.conf
