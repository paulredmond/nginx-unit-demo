# Nginx Unit Dockerfile

## Setup

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