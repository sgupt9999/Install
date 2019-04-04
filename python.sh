#!/bin/bash
# Installing the latest version of python on Centos/RHEL 7+


if [[ $EUID != "0" ]]
then
	echo "ERROR. Need to have root privileges to run this script"
	exit 1
fi

GROUPPACKAGES="development tools" ## This installs a lot of dependecies that might be needed
PACKAGES="libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel \
	    sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel \
	    expat-devel lsof wget words which"
PYTHONFILENAME="Python-3.6.8.tar.xz"
PYTHONFILEURL="https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz"
PYTHONINSTALLDIR="/usr/src/Python-3.6.8"

#yum group remove -y $GROUPPACKAGES
yum group install -y $GROUPPACKAGES
#yum remove -y $PACKAGES
yum install -y $PACKAGES

sed -i "s$.*secure_path.*$&:/usr/local/bin$" /etc/sudoers ## Add /usr/local/bin to the secure path. These are paths looked at when we run using sudo

cd /usr/src
rm -rf $PYTHONFILENAME
rm -rf $PYTHONINSTALLDIR
wget $PYTHONFILEURL
tar -xf $PYTHONFILENAME
cd $PYTHONINSTALLDIR
./configure --enable-optimizations
make altinstall ## This causes in to not replace the built in python execuatable


