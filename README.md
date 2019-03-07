# Шашлыки

Приложение для создания событий. Другие пользователи могут подписываться на события, обсуждать их, добавлять фотографии.

## Демо

http://letsbbq.herokuapp.com - Версия на хероку с Sendgrid

https://emptybox.ru - Версия на VPS с Mailgun

## Стек
* Ruby 2.5.3

* Rails 5.2.2

* [fog-aws](https://github.com/fog/fog-aws) (AWS S3)

* [Devise](https://github.com/plataformatec/devise)

* [Carrierwave](https://github.com/carrierwaveuploader/carrierwave)

* [ekko-lightbox](http://ashleydw.github.io/lightbox/)

* [Rmagick](https://github.com/rmagick/rmagick)

* [Sendgrid](https://sendgrid.com/) (for heroku deployment)

* [Mailgun](https://mailgun.com/) (for vps deployment)

* [Omniauth-Vkontakte](https://github.com/mamantoha/omniauth-vkontakte)

* [Omniauth-Facebook](https://github.com/mkdynamic/omniauth-facebook)

* [rails-i18n](https://github.com/svenfuchs/rails-i18n)

* [rails admin](https://github.com/sferik/rails_admin)

* [simple form](https://github.com/plataformatec/simple_form)

* [Bootstrap](https://github.com/twbs/bootstrap-rubygem)


## Установка

У Вас должен быть установлен bundler

Устанавливаем все нужные гемы:

```
bundle install
``` 

Прогоняем миграции:

```
rake db:migrate
```

Запускаем приложение:

```
bundle exec rails s
```

На локальном хосте localhost:3000 будет доступно для использования данное приложение

Для деплоя на хероку, смотрите инструкцию на их сайте. Также нужно будет прописать свои логины, пароли, ключи.

## Детали
В приложении реализована возможность установки пин-кода на свое событие, для ограничения доступа к нему. 

Оповещение о различных действиях через email.

В приложении используется загрузка картинок на AWS S3. Также используются Devise, Carrierwave, Lightbox, Rmagick, Sendgrid, Omniauth(Vkontakte, Facebook), i18n, rails admin, simple form, Bootstrap.

На VPS настроена отправка и прием почты через Mailgun. Используется деплой через Capistrano (ветка vps_deploy).

## Автор
[Denis Gavrilin](https://github.com/swol1)


