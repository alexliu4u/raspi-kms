FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>

RUN apt-get update && apt-get install -y git apt-utils --no-install-recommends apt-utils
RUN cd /var/local
RUN git clone https://github.com/alexliu4u/vlmcsd.git
RUN cd /var/log
RUN mkdir vlmcsd
RUN chmod 777 /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc 

EXPOSE 1688
ENTRYPOINT ["/var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc"]
CMD ["-l","/var/log/vlmcsd/run.log"]
