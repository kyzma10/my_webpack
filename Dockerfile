FROM ubuntu:trusty

# Устанавливаем nginx + nodejs
RUN apt-get update && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_9.x | sudo bash - && \
    apt-get -y install python build-essential nodejs  nginx


# Кешируем node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

# Указываем рабочую директорию
WORKDIR /src
ADD . /src

# Собираем фронтенд
RUN npm run build:prod

# Удаляем дефолтный конфиг
RUN rm -v /etc/nginx/nginx.conf

# Копируем новый конфиг
ADD nginx.conf /etc/nginx/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE  80
CMD nginx