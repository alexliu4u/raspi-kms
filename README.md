# raspi-kms
mkdir /var/local/kms
docker run -d --restart=always -p1688:1688 -v /var/local/kms:/var/log/vlmcsd alexlau/raspi-kms:latest
