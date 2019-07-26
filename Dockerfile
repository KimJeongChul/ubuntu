FROM ubuntu:19.04
MAINTAINER kimjeongchul

# Setup build environment for libpam
RUN apt update -y


# Install program
RUN \
  apt update && \
  apt -y upgrade && \
  apt install -y build-essential && \
  apt install -y software-properties-common && \
  apt install -y vim net-tools wget ssh htop iputils-ping sudo git make curl man unzip  && \
  rm -rf /var/lib/apt/lists/*
  
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]

RUN service ssh start
