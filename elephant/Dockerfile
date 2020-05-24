FROM ubuntu

RUN apt-get update 
RUN apt-get install -y vim
RUN apt-get install -y telnet
RUN apt-get install -y openssh-server
RUN apt-get install -y inetutils-ping
RUN apt-get install -y git
RUN apt-get install -y ruby-full build-essential zlib1g-dev

ADD jdk-8u251-linux-x64.tar.gz /opt
ADD apache-maven-3.6.3-bin.tar.gz /opt
ADD node-v12.16.3-linux-x64.tar.xz /opt


COPY hosts /tmp/hosts

# 更改ssh端口并设置允许root登录
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'Port 30001' >> /etc/ssh/sshd_config

# 配置git
RUN git config --global user.name "renjiyun"
RUN git config --global user.email "wozaijixu@msn.cn"
RUN git config --global credential.helper store
RUN git config --global --add core.filemode false



# 配置环境变量
ENV LANG=C.UTF-8
ENV JAVA_HOME=/opt/jdk1.8.0_251
ENV MAVEN_HOME=/opt/apache-maven-3.6.3
ENV NODE_HOME=/opt/node-v12.16.3-linux-x64
ENV GEM_HOME=/opt/gems
ENV PATH=${PATH}:${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${NODE_HOME}/bin:/${GEM_HOME}/bin


# 安装需要的gem
RUN gem install jekyll 
RUN gem install bundler


# 入口
ENTRYPOINT cat /tmp/hosts >> /etc/hosts; rm -rf /tmp/*; service ssh start; /bin/bash


# 容器启动后
# 1. 设置root密码


