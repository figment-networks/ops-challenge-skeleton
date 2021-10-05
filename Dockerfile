FROM jrei/systemd-ubuntu:18.04

RUN apt-get update \
  && apt-get install -y \
  python3-pip \
  curl \
  wget \
  sudo

ADD requirements.txt /tmp/

RUN pip3 install -r /tmp/requirements.txt

RUN useradd -m -s /bin/bash -G sudo figment

WORKDIR /tmp/ansible
