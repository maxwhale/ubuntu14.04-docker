#
# MAINTAINER          Max
# DOCKER-VERSION      1.10
# UBUNTU-VERSION      14.04
# Dockerfile-VERSION  1.0
# DATE                02/23/2016
#

FROM ubuntu:14.04
MAINTAINER Max

ENV TZ "Asia/Shanghai"
ENV TERM xterm

ADD sources.list /etc/apt/sources.list

# Update
RUN apt-get -y update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wget tar screen htop passwd nano openssh-server pwgen
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**
ENV ROOT_PASS LNMP123

VOLUME ["/home"]

EXPOSE 80 
EXPOSE 21 
EXPOSE 22 
EXPOSE 3306 
EXPOSE 6379 
EXPOSE 11211

CMD ["/run.sh"]
