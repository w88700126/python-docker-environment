FROM centos:7
RUN yum update -y && yum install -y epel-release make gcc gcc-c++ libffi-devel python-devel openssl-devel python-setuptools && yum install -y python-pip mysql-devel supervisor iproute unzip && pip install --upgrade pip && pip install MySQL-python==1.2.5 && pip install twisted==13.2.0 && pip install autobahn[twisted] 
ADD https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip /
RUN unzip -d / protoc-3.5.1-linux-x86_64.zip
COPY bin/protoc /usr/local/bin/
COPY include/google /usr/local/include/