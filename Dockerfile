# See also Dockerfile for official postgres image
# https://github.com/docker-library/postgres/blob/master/Dockerfile.template
FROM ubuntu
MAINTAINER Gianluca Casati <casati_gianluca@yahoo.it>

# Install deps
RUN apt-get update -y && apt-get install -y \
    wget make gcc libreadline-dev zlib1g-dev

# Install PostgreSQL
RUN wget -q https://ftp.postgresql.org/pub/source/v8.0.2/postgresql-8.0.2.tar.gz; \
    tar xf postgresql-8.0.2.tar.gz; \
    cd postgresql-8.0.2; \
    ./configure --prefix=/usr/local && make && make install; \
    rm -rf postgresql-8.0.2*

# Create user
RUN groupadd -r postgres --gid=999 && useradd -r -g postgres --uid=999 postgres
