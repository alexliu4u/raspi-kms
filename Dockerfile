FROM resin/rpi-raspbian:latest
MAINTAINER alexliu4u <alexliu4u@hotmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN sudo apt-get update -y
RUN sudo apt-get dist-upgrade
RUN sudo apt-get install git -y
RUN sudo cd /var/local
RUN sudo git clone https://github.com/alexliu4u/vlmcsd.git
RUN sudo cd /var/log
RUN sudo mkdir vlmcsd
RUN sudo chmod 777 /var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc 

EXPOSE 1688
ENTRYPOINT ["/var/local/vlmcsd/binaries/Linux/arm/little-endian/glibc/vlmcsd-armv6hf-Raspberry-glibc"]
CMD ["-l","/var/log/vlmcsd/run.log"]
