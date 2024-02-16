FROM alpine:latest

RUN apk --no-cache add curl bash

ADD dns-sync.sh /app/
ADD entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh /app/dns-sync.sh
WORKDIR /app

ENTRYPOINT ["bash", "/app/entrypoint.sh"]
CMD [""]