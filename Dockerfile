FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y \
        python-pip \
        python-dev \
        liblzma-dev \
        libevent1-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install docker-registry==0.9.0

EXPOSE 5000
VOLUME /config

CMD ["docker-registry"]