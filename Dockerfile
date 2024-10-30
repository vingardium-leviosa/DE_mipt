# Используем минималистичный образ Alpine для Nginx
FROM nginx:alpine

# Создаём конфигурационный файл для Nginx
RUN echo "\
server { \
    listen 80; \
    location / { \
        limit_except POST { deny all; } \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
}" > /etc/nginx/conf.d/default.conf

# Копируем статические файлы
COPY ./html /usr/share/nginx/html

# Открываем порт 80
EXPOSE 80

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]