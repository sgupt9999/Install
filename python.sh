#!/bin/bash
# Installing the latest version of python on Centos/RHEL 7+


if [[ $EUID != "0" ]]
then
	echo "ERROR. Need to have root privileges to run this script"
	exit 1
fi

GROUPPACKAGES="development tools"
PACKAGES="libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel \
	    sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel \
	    expat-devel lsof wget words which"
PYTHONFILENAME="Python-3.6.5.tar.xz"
PYTHONFILEURL="https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz"
PYTHONINSTALLDIR="/usr/src/Python-3.6.5"

#yum group remove -y $GROUPPACKAGES
yum group install -y $GROUPPACKAGES
#yum remove -y $PACKAGES
yum install -y $PACKAGES

cd /usr/src
rm -rf $PYTHONFILENAME
rm -rf $PYTHONINSTALLDIR
wget $PYTHONFILEURL
tar -xf $PYTHONFILENAME
cd $PYTHONINSTALLDIR
./configure --enable-optimizations
make altinstall


