https://www.anaconda.com/


https://github.com/ContinuumIO



mac安装使用Anaconda Python 3.6
Anaconda，简而言之就是一个打包好的python集合，里面有包管理与环境管理工具、以及用于数据科学data science计算的python包。

从这里下载安装 https://www.anaconda.com/download/#macos。安装完成以后，设置path如下：

# 将anaconda的bin目录加入PATH，根据版本不同，也可能是~/anaconda3/bin
echo 'export PATH="~/anaconda2/bin:$PATH"' >> ~/.bashrc
# 更新bashrc以立即生效
source ~/.bashrc

配置完成后，通过命令conda – version 命令检查是否正确。

包管理：通过Anaconda可以方便地管理包，命令conda install -n python36 numpy可以在制定环境安装python36安装numpy包。

环境管理：现在我们需要安装python3.6，运行命令conda create –name python36 python=3.6 anaconda，通过source activate python36激活。

设置国内镜像：

# 添加Anaconda的TUNA镜像
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
# TUNA的help中镜像地址加有引号，需要去掉

# 设置搜索时显示通道地址
conda config --set show_channel_urls yes


