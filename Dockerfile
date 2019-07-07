FROM centos
MAINTAINER kusari-k

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y opendkim openssl
RUN yum clean all


COPY myapp.sh /usr/local/bin/
RUN  chmod 755 /usr/local/bin/myapp.sh
ENTRYPOINT ["/usr/local/bin/myapp.sh"]
