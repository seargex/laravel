FROM marcusmyers/laravel
COPY . /usr/share/nginx/html;
WORKDIR /usr/share/nginx/html;
RUN composer install
RUN cp .env.example .env
RUN php artisan key:generate
EXPOSE 80
EXPOSE 8000
CMD [ "php", "artisan", "serve", "--host=0.0.0.0" ]
