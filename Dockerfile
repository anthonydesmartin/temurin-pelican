FROM --platform=$TARGETOS/$TARGETARCH eclipse-temurin:21-jre-noble

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL org.opencontainers.image.licenses=MIT

RUN apt update -y \
    && apt install -y \
        curl \
        lsof \
        ca-certificates \
        openssl \
        git \
        tar \
        sqlite3 \
        fontconfig \
        tzdata \
        iproute2 \
        libfreetype6 \
        redis-tools \
        tini \
        zip \
        unzip \
        jq \
        libjemalloc2 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ENV MALLOC_CONF="background_thread:true,metadata_thp:auto,dirty_decay_ms:20000,muzzy_decay_ms:20000"
ENV LD_PRELOAD="/usr/lib/aarch64-linux-gnu/libjemalloc.so.2"

RUN useradd -m -d /home/container -s /bin/bash container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]