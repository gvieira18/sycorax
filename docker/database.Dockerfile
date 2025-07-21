FROM postgres:17

ENV TZ=America/Sao_Paulo
ENV DEBIAN_FRONTEND=noninteractive

RUN set -xeu;\
  apt-get -qq update;\
  apt-get -qq install --install-suggests tzdata nano ca-certificates;\
  apt-get -qq install postgresql-contrib postgresql-17-postgis-3 postgresql-17-plsh;\
  apt-get -qq clean;

RUN set -xeu;\
  ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime;\
  echo ${TZ} > /etc/timezone;\
  dpkg-reconfigure tzdata --frontend noninteractive;

CMD [ "postgres" ]
