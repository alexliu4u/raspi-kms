FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>

RUN [ "cross-build-start"]
RUN apt-get update \
    && apt-get install git -y \
    && cd /var/local \
    && mkdir kms \
    && git clone https://github.com/alexliu4u/vlmcsd.git \
    && cd /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc \
    && cp vlmcsd-armv6hf-Raspberry-glibc /var/local/kms \
    && cd /var/local/kms \
    && cp vlmcsd-armv6hf-Raspberry-glibc vlmcsdpi \
    && chmod 777 vlmcsdpi \
    && rm -rf /var/local/vlmcsd \
    && cd /var/log \
    && mkdir vlmcsd \
    && apt-get clean
RUN [ "cross-build-end"]

VOLUME ["/var/log/vlmcsd"]

EXPOSE 1688

ENTRYPOINT ["/var/local/kms/vlmcsdpi","-l","/var/log/vlmcsd/run.log"]
