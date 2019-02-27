### Шашлыки

Приложение для создания событий. Другие пользователи могут подписываться на события, обсуждать их, добавлять фотографии.

### Демо

http://letsbbq.herokuapp.com - Версия на хероку с Sendgrid

https://emptybox.ru - Версия на VPS с Mailgun

### Детали

`ruby 2.5.3`

`rails 5.2.2`

В приложении реализована возможность установки пин-кода на свое событие, для ограничения доступа к нему. 

Оповещение о различных действиях через email.

В приложении используется загрузка картинок на AWS S3. Также используются Devise, Carrierwave, Lightbox, Rmagick, Sendgrid, Omniauth(Vkontakte, Facebook), i18n, rails admin, simple form, Bootstrap.

На VPS настроена отправка и прием почты через Mailgun. Используется деплой через Capistrano (ветка vps_deploy).

### Установка

Склонируйте данный гит репозиторий с сайта, либо в консоли введите git clone <link_to_this_repo>

В консоли, в папке с приложением, введите bundle install (у Вас должен быть установлен bundler)

Введите rails s. На локальном хосте localhost:3000 будет доступно для использования данное приложение

Для деплоя на хероку, смотрите инструкцию на их сайте. Также нужно будет прописать свои логины, пароли, ключи.
