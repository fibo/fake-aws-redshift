FROM ubuntu
MAINTAINER Gianluca Casati <casati_gianluca@yahoo.it>

RUN apt-get update -y && apt-get install -y \
    wget make gcc libreadline-dev zlib1g-dev

RUN wget -q https://ftp.postgresql.org/pub/source/v8.0.2/postgresql-8.0.2.tar.gz; \
    tar xf postgresql-8.0.2.tar.gz; \
    cd postgresql-8.0.2; \
    ./configure --prefix=/usr/local && make && make install
