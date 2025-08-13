FROM nginx:latest

COPY ./conf/hosts /etc/hosts

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/http/jenkins.conf /etc/nginx/conf.d/jenkins.conf
COPY ./conf/http/gitlab.conf /etc/nginx/conf.d/gitlab.conf
COPY ./conf/http/phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

COPY ./html /usr/share/nginx/html
