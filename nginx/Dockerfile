FROM nginx:latest

COPY ./conf/hosts /etc/hosts

COPY ./conf/jenkins.conf /etc/nginx/conf.d/jenkins.conf
COPY ./conf/gitlab.conf /etc/nginx/conf.d/gitlab.conf

COPY ./html /usr/share/nginx/html

