FROM debian
MAINTAINER jakob krainz <jakob.krainz@cs.fau.de>

RUN apt-get update
RUN apt-get -y install emacs-nox mercurial
RUN apt-get -y install build-essential diffutils gdb nasm
RUN apt-get -y install openjdk-7-jre python3 ant
RUN apt-get -y install graphviz
RUN apt-get -y install screen
RUN apt-get -y install openjdk-7-jdk
RUN apt-get -y install less locales bsdmainutils
RUN apt-get -y install junit4

RUN useradd -m ue2 -s /bin/bash
RUN echo "de_DE.UTF-8 UTF-8\nen_GB.UTF-8 UTF-8\nen_US.UTF-8 UTF-8\n" > /etc/locale.gen
RUN locale-gen


USER ue2
WORKDIR /home/ue2

ADD .bashrc-addnl .emacs .hgrc 75ECC52D.txt .screenrc .bash_login /home/ue2/
RUN cat /home/ue2/.bashrc-addnl >> /home/ue2/.bashrc
# commented out, password required
# RUN hg clone https://XXX:XXX@faui2hg.cs.fau.de/mcc/releases/SS15/ue2-java
# RUN hg clone https://XXX:XXX@faui2hg.cs.fau.de/mcc/releases/SS15/ue2-python
RUN gpg --import 75ECC52D.txt

USER root
