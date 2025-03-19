#基于的基础镜像
FROM centos:7

#维护镜像的用户信息
LABEL maintainer="yangzl youngzil@163.com"

USER root

#ENV LANG=zh_CN.UTF-8 \
#    LANGUAGE=zh_CN:zh \
#    LC_ALL=zh_CN.UTF-8
ENV MYPATH /usr/local

WORKDIR $MYPATH

#镜像操作指令安装apache软件
RUN yum -y install httpd \
    && echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf \
    && yum -y install vim \
    && yum -y install git \
    && git config --global user.name yangzl \
    && git config --global user.email youngzil@163.com

# RUN yum -y update \
#     && yum -y install httpd \
#     && yum -y install vim \
#     && yum -y install git \
#     && git config --global user.name yangzl \
#     && git config --global user.email youngzil@163.com

#RUN yum install -y  net-tools
#RUN yum install -y  ncurses

# COPY index.html /var/www/html/

# 在容器中运行指定的命令。
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD ["-D", "FOREGROUND"]

#开启 80 端口
EXPOSE 80

# 测试
# 生成镜像,注意别忘了末尾有"."
# docker build -f Dockerfile -t test/centos7_httpd .
# 新镜像运行容器
# docker run --name centos7-httpd -v /Users/quarks:/usr/local/yangzl -p 1216:80 -dit test/centos7_httpd
# 用这个命令，会覆盖CMD，httpd就起不来了
# docker run --name centos7 -v /Users/quarks:/usr/local/yangzl -p 1216:80 -it test/centos7_v2 /bin/bash

# 外主机测试
# http://192.168.61.11:1216/

#测试后清理容器
#docker rm -f centos7
