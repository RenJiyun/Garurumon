FROM ubuntu:18.04

# 安装软件
RUN apt-get update 
RUN apt-get install -y vim
RUN apt-get install -y telnet
RUN apt-get install -y openssh-server
RUN apt-get install -y inetutils-ping
RUN apt-get install -y git
RUN apt-get install -y ruby-full build-essential zlib1g-dev
RUN apt-get install -y net-tools

# 安装需要的gem
RUN gem install jekyll 
RUN gem install bundler

# 安装和配置python3.7环境
RUN wget -v https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O /tmp/conda.sh
RUN /bin/bash /tmp/conda.sh -b -p /opt/anaconda3
RUN /opt/anaconda3/bin/conda init bash
RUN rm -f /tmp/conda.sh


# 安装java环境
RUN apt-get -y install openjdk-8-jdk


# 下载链接可能需要更改
WORKDIR /tmp
RUN wget -v https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -O apache-maven-3.6.3-bin.tar.gz
RUN wget -v https://npm.taobao.org/mirrors/node/v14.3.0/node-v14.3.0-linux-x64.tar.xz -O node-v14.3.0-linux-x64.tar.xz
RUN wget -v https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_amd64.tar.gz -O frp_0.33.0_linux_amd64.tar.gz

RUN tar -xzvf apache-maven-3.6.3-bin.tar.gz
RUN tar -xvJf node-v14.3.0-linux-x64.tar.xz
RUN tar -xzvf frp_0.33.0_linux_amd64.tar.gz

RUN mv apache-maven-3.6.3 /opt/
RUN mv node-v14.3.0-linux-x64 /opt/
RUN mv frp_0.33.0_linux_amd64 /opt/


# 更改ssh端口并设置允许root登录
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'Port 30001' >> /etc/ssh/sshd_config

# 配置git
RUN git config --global user.name "renjiyun"
RUN git config --global user.email "wozaijixu@msn.cn"
RUN git config --global credential.helper store
RUN git config --global --add core.filemode false

# 配置环境变量
RUN echo "export LANG=C.UTF-8" >> /root/.bashrc
RUN echo "export MAVEN_HOME=/opt/apache-maven-3.6.3" >> /root/.bashrc
RUN echo "export NODE_HOME=/opt/node-v14.3.0-linux-x64" >> /root/.bashrc
RUN echo "export GEM_HOME=/opt/gems" >> /root/.bashrc
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /root/.bashrc
RUN echo 'export PATH=$PATH:$MAVEN_HOME/bin:$NODE_HOME/bin:$GEM_HOME/bin' >> /root/.bashrc

# 之所以配置跟上面一样的环境变量是有原因的，不要乱改
ENV LANG=C.UTF-8
ENV MAVEN_HOME=/opt/apache-maven-3.6.3
ENV NODE_HOME=/opt/node-v12.16.3-linux-x64
ENV GEM_HOME=/opt/gems
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=${PATH}:${MAVEN_HOME}/bin:${NODE_HOME}/bin:/${GEM_HOME}/bin


# 配置命令别名
RUN echo "alias install='mvn clean install -Dmaven.test.skip=true'" >> /root/.bashrc
RUN echo "alias frpc='/opt/frp_0.33.0_linux_amd64/frpc -c /opt/frp_0.33.0_linux_amd64/frpc.ini'" >> /root/.bashrc


# 清除安装包
RUN rm -rf /tmp/*

WORKDIR /root

# 风筝,代表连接
RUN mkdir kite
RUN ln -s /opt/frp_0.33.0_linux_amd64/frpc.ini /root/kite/frpc.ini


# ynet工作相关
RUN echo "http://renjiyun:yunjiren123@git.ynet.io" >> .git-credentials 


# 入口
ENTRYPOINT service ssh start; /bin/bash

# 容器启动后
# 1. 设置root密码


