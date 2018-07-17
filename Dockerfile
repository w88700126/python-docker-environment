FROM centos:7
RUN yum update -y && yum install -y epel-release make gcc gcc-c++ libffi-devel python-devel openssl-devel python-setuptools && yum install -y python-pip mysql-devel supervisor iproute && pip install --upgrade pip && pip install MySQL-python==1.2.5 && pip install twisted==13.2.0 
ADD https://github.com/google/protobuf/releases/download/v3.5.1/protobuf-python-3.5.1.tar.gz /
