FROM alpine

RUN apk add php bash

# Add source code
WORKDIR /app
ADD ./src .

# Add entrypoint and set permissions
ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Setup port
# don't work on Heroku
ENV PORT=8080
EXPOSE $PORT

CMD ["/entrypoint.sh"]
