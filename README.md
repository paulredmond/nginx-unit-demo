# Nginx Unit Dockerfile

Here's how to set up the example Laravel project:

```
$ docker exec -it the-container bash

# In the container
$ curl -X PUT -d @/www/laravel/app.json  \
    --unix-socket /var/run/control.unit.sock http://localhost/
```