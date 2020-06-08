FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y libxml2-dev

ADD anyconnect.tar.gz /tmp

WORKDIR /tmp/anyconnect/vpn

RUN echo y | sh vpn_install.sh

COPY AnyConnectLocalPolicy.xml /opt/cisco/anyconnect

WORKDIR /tmp
RUN rm -rf *

WORKDIR /root

RUN echo "alias vpnd=/opt/cisco/anyconnect/bin/vpnagentd" >> .bashrc
RUN echo "alias vpn=/opt/cisco/anyconnect/bin/vpn" >> .bashrc

