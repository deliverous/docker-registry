FROM ubuntu:trusty

RUN apt-get update \
    && apt-get install -y \
        python-pip \
        python-dev \
        liblzma-dev \
        libevent1-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install docker-registry==0.9.0

ENV DOCKER_REGISTRY_CONFIG /config/registry.yml
ENV SETTINGS_FLAVOR production

EXPOSE 5000
VOLUME /config

CMD ["docker-registry"]