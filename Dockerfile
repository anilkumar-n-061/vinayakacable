FROM nginx:latest
COPY /public /usr/share/nginx/html/public
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
