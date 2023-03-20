FROM centos:7

MAINTAINER yangzl <youngzil@163.com>

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

ENV MYPATH /usr/local
WORKDIR $MYPATH

RUN yum -y install vim
RUN yum -y install git

#RUN yum -y install vim
#RUN yum install -y  net-tools
#RUN yum install -y  ncurses

#EXPOSE 80

# 在容器中运行指定的命令。
CMD [ "git", "config", "--global", "user.name", "yangzl" ]
CMD [ "git", "config", "--global", "user.email", "youngzil@163.com" ]

CMD /bin/bash

#docker build -t yore/centos7_v1 .
#docker run --name centos7 -v /Users/quarks:/usr/local/yangzl -it yore/centos7_v1 /bin/bash
#docker rm -f centos7