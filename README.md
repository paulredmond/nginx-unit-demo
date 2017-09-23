# Nginx Unit Dockerfile

## Setup

This is just an experiment so I didn't spend any time automating the setup of Laravel. You need to install and have [composer](https://getcomposer.org/) in your local path, and then run the following to set up the Laravel application:

```
$ cd src/
$ cp .env.example .env
$ composer install
$ php artisan key:generate
```

To experiment with this container, you need to build it and then start it:

```
bin/build && bin/start
```

The application should be available at [http://localhost:8300](http://localhost:8300).

## The Configuration Object

Here's how you would set up the configuration object inside the container using a Unix Socket:

```
$ docker exec -it the-container bash

# In the container
$ curl -X PUT -d @/www/laravel/app.json  \
    --unix-socket /var/run/control.unit.sock http://localhost/
```

The configuration object for laravel is located in [src/app.json](src/app.json).
