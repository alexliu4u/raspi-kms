FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>

RUN apt-get update && apt-get install -y git --no-install-recommends apt-utils \
    && cd /var/local \
    && git clone https://github.com/alexliu4u/vlmcsd.git \
    && cd /var/log \
    && mkdir vlmcsd
    
RUN chmod 777 /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc 

EXPOSE 1688
CMD ["/var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc","-l","/var/log/vlmcsd/run.log"]
