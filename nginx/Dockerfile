FROM nginx:latest

COPY ./conf/hosts /etc/hosts

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/jenkins.conf /etc/nginx/jenkins.conf
COPY ./conf/gitlab.conf /etc/nginx/gitlab.conf


COPY ./html /usr/share/nginx/html

