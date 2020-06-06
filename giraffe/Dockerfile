FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y wget


WORKDIR /tmp
RUN wget -v https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_amd64.tar.gz -O frp_0.33.0_linux_amd64.tar.gz
RUN tar -xzvf frp_0.33.0_linux_amd64.tar.gz
RUN mv frp_0.33.0_linux_amd64 /opt/


WORKDIR /opt
COPY frpc.ini frp_0.33.0_linux_amd64

# 清理安装包
RUN rm -rf /tmp/*

WORKDIR /root

ENTRYPOINT /opt/frp_0.33.0_linux_amd64/frpc -c /opt/frp_0.33.0_linux_amd64/frpc.ini
