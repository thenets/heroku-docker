FROM alpine

RUN apk add php

# Add source code
WORKDIR /app
ADD ./src .

# Add entrypoint and set permissions
ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN apk add bash

# Setup port
# don't work on Heroku
ENV PORT=8080
EXPOSE $PORT

CMD ["/entrypoint.sh"]
