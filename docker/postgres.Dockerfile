# syntax=docker/dockerfile:1.15.0

FROM postgres:18-alpine3.22@sha256:aa7c4a8932f5bafe14700a789339d102251d0f7d53503a201247b5f5990da5e2

ENV TZ=America/Sao_Paulo

RUN set -eux;\
    apk update;\
    apk add --no-cache tzdata nano ca-certificates;\
    apk add --no-cache postgresql-contrib postgis;\
    ln -snf /usr/share/zoneinfo/"${TZ}" /etc/localtime;\
    echo "${TZ}" > /etc/timezone;\
    update-ca-certificates;\
    rm -rf /var/cache/apk/*;
