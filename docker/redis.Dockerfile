FROM redis:7-alpine3.21

ENV TZ=America/Sao_Paulo

RUN set -xeu; \
  apk update; \
  apk add --no-cache tzdata nano ca-certificates; \
  ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime; \
  echo ${TZ} > /etc/timezone; \
  update-ca-certificates;

CMD ["redis-server"]
