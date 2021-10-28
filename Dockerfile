FROM alpine:latest

# install dependencies
RUN apk add ca-certificates curl tar netcat-openbsd

# get arguments
ARG XMRIG_VERSION=0
ENV XMRIG_VERSION=$XMRIG_VERSION

# download & extract miner
WORKDIR /miner
RUN curl -Lo xmrig.tar.gz "https://github.com/xmrig/xmrig/releases/download/v$XMRIG_VERSION/xmrig-$XMRIG_VERSION-linux-static-x64.tar.gz"
RUN tar -xzf xmrig.tar.gz
ADD entrypoint.sh .

WORKDIR /miner/xmrig-$XMRIG_VERSION

ADD config.json .

ENTRYPOINT ["sh", "/miner/entrypoint.sh"]
