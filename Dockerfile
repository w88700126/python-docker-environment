FROM centos:7
RUN yum update -y && yum install -y epel-release make gcc gcc-c++ libffi-devel python-devel openssl-devel python-setuptools && yum install -y python-pip mysql-devel supervisor iproute && pip install --upgrade pip && pip install MySQL-python==1.2.5 && pip install twisted==13.2.0 
ADD https://github.com/google/protobuf/releases/download/v3.5.1/protobuf-python-3.5.1.tar.gz /
RUN tar -zxvf protobuf-python-3.5.1.tar.gz 
RUN cd protobuf-3.5.1
RUN ./autogen.sh
RUN ./configure --prefix=/usr/local/protobuf --disable-shared --with-pic
RUN make && make check && make install
RUN ldconfig
RUN cd python
RUN python setup.py build
RUN python setup.py install
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/protobuf/lib/;export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/protobuf/lib/;export PATH=$PATH:/usr/local/protobuf/bin/;export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/protobuf/include/;export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/protobuf/include/;export PKG_CONFIG_PATH=/usr/local/protobuf/lib/pkgconfig/" >> /etc/profile
RUN rm -rf /protobuf-3.5.1