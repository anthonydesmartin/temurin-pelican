# GraalVM Java 21 for Pelican Panel

Custom Temurin Java 21 Docker image optimized for Minecraft servers on Pelican Panel.

## Features
- Temurin Java 21
- Multi-architecture support (AMD64 + ARM64)
- Optimized for Oracle Cloud Ampere
- Compatible with Pelican Panel and Pterodactyl

## Usage

In your Pelican Panel egg, use:

ghcr.io/anthonydesmartin/temurin-pelican:21

## Startup Command (Optimized for 12GB RAM)

```bash
java -Xms12288M -Xmx12288M -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+ParallelRefProcEnabled -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15 -XX:InitiatingHeapOccupancyPercent=15 -XX:+AlwaysPreTouch  -jar {{SERVER_JARFILE}} --nogui
```