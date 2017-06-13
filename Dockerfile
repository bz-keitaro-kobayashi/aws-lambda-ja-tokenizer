FROM amazonlinux:latest

RUN echo "ap-northeast-1" > /etc/yum/vars/awsregion
RUN yum update -y && \
	yum install -y python27-virtualenv git gcc gcc-c++ libffi-devel \
		openssl-devel wget zip && \
	yum clean all

RUN wget http://mirror.centos.org/centos/6/os/x86_64/Packages/nkf-2.0.8b-6.2.el6.x86_64.rpm
RUN rpm -ivh nkf-2.0.8b-6.2.el6.x86_64.rpm

COPY . /app
WORKDIR /app

RUN mkdir /app/out || true

RUN virtualenv env
RUN source env/bin/activate && pip install -r requirements/local.txt && fab setup

ENTRYPOINT ["/app/entrypoint.sh"]
