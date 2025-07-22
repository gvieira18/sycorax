# syntax=docker/dockerfile:1.15.0

FROM postgres:17-alpine3.22@sha256:6567bca8d7bc8c82c5922425a0baee57be8402df92bae5eacad5f01ae9544daa

ENV TZ=America/Sao_Paulo

RUN set -eux;\
    apk update;\
    apk add --no-cache tzdata nano ca-certificates;\
    apk add --no-cache postgresql-contrib postgis;\
    ln -snf /usr/share/zoneinfo/"${TZ}" /etc/localtime;\
    echo "${TZ}" > /etc/timezone;\
    update-ca-certificates;\
    rm -rf /var/cache/apk/*;
