FROM resin/rpi-raspbian:latest
MAINTAINER elarkasi <elarkasi@gmail.com>

RUN [ "cross-build-start"]
RUN apt-get update \
    && apt-get install git -y \
    && mkdir /var/local/kms \
    && cd /var/local \
    && git clone https://github.com/elarkasi/vlmcsd.git \
    && cp /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc /var/local/kms \
    && cd /var/local/kms \
    && mv vlmcsd-armv6hf-Raspberry-glibc vlmcsdpi \
    && chmod u+x vlmcsdpi \
    && rm -rf /var/local/vlmcsd \
    && apt-get clean
RUN [ "cross-build-end"]
EXPOSE 1688
ENTRYPOINT ["/var/local/kms/vlmcsdpi","-D"]

