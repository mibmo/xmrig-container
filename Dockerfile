FROM alpine:latest

# install dependencies
RUN apk add ca-certificates curl tar
WORKDIR /miner

# get arguments
ARG XMRIG_VERSION=0
ENV XMRIG_VERSION=$XMRIG_VERSION

# download & extract miner
RUN curl -Lo xmrig.tar.gz "https://github.com/xmrig/xmrig/releases/download/v$XMRIG_VERSION/xmrig-$XMRIG_VERSION-linux-static-x64.tar.gz"
RUN tar -xzf xmrig.tar.gz
WORKDIR /miner/xmrig-$XMRIG_VERSION

ADD config.json .

ENTRYPOINT ["./xmrig", "--config=config.json", "--no-color"]
