FROM debian:stable-slim

SHELL ["/bin/bash", "-c"]

WORKDIR /app
COPY . .

RUN apt-get -y update && apt-get -y install curl && apt-get -y install unzip && curl -fsSL https://bun.sh/install | bash && source /root/.bashrc && bun install

EXPOSE 3000

ENTRYPOINT [ "bun", "run", "src/index.js"]