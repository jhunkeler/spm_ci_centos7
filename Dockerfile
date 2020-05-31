FROM centos:7
RUN yum install -y epel-release && \
	yum update -y && \
	yum clean -y all
RUN yum install -y \
        make \
        patchelf \
        binutils \
        curl-devel \
        openssl-devel \
        file \
        which \
        rsync \
        tar \
        cmake3 \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        glibc-devel \
        libxslt && yum clean -y all