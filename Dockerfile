FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>

RUN [ "cross-build-start"]
RUN apt-get update \
    && apt-get install git -y \
    && mkdir /var/local/kms \
    && git clone https://github.com/alexliu4u/vlmcsd.git \
    && cd /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc \
    && cp vlmcsd-armv6hf-Raspberry-glibc /var/local/kms \
    && cd /var/local/kms \
    && mv vlmcsd-armv6hf-Raspberry-glibc vlmcsdpi \
    && chmod u+x vlmcsdpi \
    && rm -rf /var/local/vlmcsd \
    && apt-get clean
RUN [ "cross-build-end"]
EXPOSE 1688
ENTRYPOINT ["/var/local/kms/vlmcsdpi","-D"]

