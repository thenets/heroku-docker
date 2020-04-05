# Heroku + Docker

How to integrate Heroku automated build + Docker.

## Heroku config file

Add the `heroku.yml` to the repository root. That file declares where the Dockerfile is located:

```yaml
build:
  docker:
    web: Dockerfile
```

## Customizable server port

The Heroku container support requires a non fixed port. Heroku will define an environment variable called `$PORT` that may change on every deployment. So your application needs to be flexible to have this support.

In this project you can find the use of this variable at `entrypoint.sh`:

```bash
#!/bin/bash

cd /app

php -S 0.0.0.0:${PORT}
```
