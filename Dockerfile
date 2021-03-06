FROM multiarch/alpine:armhf-edge AS builder
WORKDIR /root
RUN apk add --no-cache git make build-base && \
    git clone --branch master --single-branch https://github.com/Wind4/vlmcsd.git && \
    cd vlmcsd/ && \
    make

FROM multiarch/alpine:armhf-edge
MAINTAINER elarkasi <elarkasi@gmail.com>

COPY --from=builder /root/vlmcsd/bin/vlmcsd /usr/bin/vlmcsd
EXPOSE 1688
CMD [ "/usr/bin/vlmcsd", "-D", "-e" ]
