FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>

RUN apt-get update && apt-get install -y git --no-install-recommends apt-utils \
    && cd /var/local \
    && mkdir kms \
    && git clone https://github.com/alexliu4u/vlmcsd.git \
    && cp /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc /var/local/kms/vlmcsdpi \
    && cd kms \
    && mkdir log
    
RUN chmod 777 /var/local/kms/vlmcsdpi \
    && rm -rf /var/local/vlmcsd/*

WORKDIR /var/local/kms/log

EXPOSE 1688
ENTRYPOINT ["/var/local/kms/vlmcsdpi","-l","/var/local/kms/log/vlmcsdpi.log"]
