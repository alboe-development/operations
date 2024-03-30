FROM openjdk:21-slim-bookworm

ARG MINECRAFT_VERSION_NUMBER
ARG PAPER_BUILD_NUMBER
ARG EULA

ENV MEMORY_MAX=4G
ENV MEMORY_MIN=2G

RUN apt update && apt upgrade -y && apt install curl -y
RUN mkdir /setup

RUN curl -o /setup/server.jar https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION_NUMBER}/builds/${PAPER_BUILD_NUMBER}/downloads/paper-${MINECRAFT_VERSION_NUMBER}-${PAPER_BUILD_NUMBER}.jar

RUN echo "minecraft-version-number: ${MINECRAFT_VERSION_NUMBER}-${PAPER_BUILD_NUMBER}" > /setup/version.txt

RUN echo "generating eula if instructed"
RUN if [ EULA ]; then echo "eula=true" > /setup/eula.txt; fi

CMD if [ -f "/minecraft/server.jar" ]; then cd /minecraft && java -Xms${MEMORY_MIN} -Xmx${MEMORY_MAX} -jar server.jar --nogui; else cp -avr /setup/* /minecraft/ && echo "server files are ready, restart the container to start the server"; fi