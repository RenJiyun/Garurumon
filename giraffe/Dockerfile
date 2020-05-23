FROM ubuntu

ADD frp_0.33.0_linux_amd64.tar.gz /opt
COPY frpc.ini /opt/frp_0.33.0_linux_amd64/frpc.ini
ENTRYPOINT /opt/frp_0.33.0_linux_amd64/frpc -c /opt/frp_0.33.0_linux_amd64/frpc.ini
