# syntax=docker/dockerfile:1.15.0

FROM redis:8-alpine3.22@sha256:fc785a6b2936ec73d0c1c7dc81fb72383e0ce5d392d1c6b20dbafa68f0ff0572

ENV TZ=America/Sao_Paulo

RUN set -xeu; \
    apk update;\
    apk add --no-cache tzdata nano ca-certificates;\
    ln -snf /usr/share/zoneinfo/"${TZ}" /etc/localtime;\
    echo "${TZ}" > /etc/timezone;\
    update-ca-certificates;\
    rm -rf /var/cache/apk/*;
