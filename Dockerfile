FROM alpine:3.7 AS base
RUN apk add build-base git bash zip unzip curl


FROM base AS test
RUN mkdir -p /app /root/.cache/luarocks
COPY * /app/
RUN apk add lua5.1 lua5.2 lua5.3 luajit lua5.1-dev lua5.2-dev lua5.3-dev luarocks luarocks5.2 luarocks5.3
RUN for V in 5.1 5.2 5.3; do echo "Installing penlight for v$V" && USER=root luarocks-$V install penlight; done
ENTRYPOINT /bin/bash -c /app/run-tests.sh
