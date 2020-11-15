FROM alpine:3.12.1
MAINTAINER tommylikehu@gmail.com

# install rsync and tini
RUN apk update && apk add tini rsync htop tzdata

ENV TZ="Asia/Shanghai"
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["tini", "--"]
CMD ["entrypoint.sh"]
