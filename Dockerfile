FROM nginx:alpine

COPY ./export /usr/share/nginx/html

EXPOSE 80