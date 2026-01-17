FROM nginx:20240618
MAINTAINER Hai Liang Wang <hain@chatopera.com>

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://www.chatopera.com"


COPY ./_public /usr/share/nginx/html
COPY ./deployment/assets/default.conf /etc/nginx/conf.d/default.conf
COPY ./deployment/assets/404.html /usr/share/nginx/html/404.html
COPY ./deployment/assets/50x.html /usr/share/nginx/html/50x.html