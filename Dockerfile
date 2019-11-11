#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
FROM nginx

COPY default.conf /etc/nginx/conf.d/

COPY www /usr/share/nginx/html

COPY server.crt /etc/nginx/certs/server.crt

COPY server.key /etc/nginx/certs/server.key

#To run
# docker build -t server:https .
# docker run -dit --name mywebsite -p 443:443 -p 80:80 server:https