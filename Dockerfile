FROM eclipse-temurin:21-jre-jammy

LABEL author="Neko"
LABEL org.opencontainers.image.description="Temurin Java 21 for Pelican Panel"

RUN apt-get update && apt-get install -y iproute2 && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/container container
USER container
WORKDIR /home/container

COPY --chmod=755 entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
