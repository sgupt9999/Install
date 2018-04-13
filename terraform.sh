#!/bin/bash
# Script to install terraform on Centos/RHEL 7+


if [[ $EUID != "0" ]]
then
	echo "ERROR. Need to have root privileges to run this script"
	exit 1
fi

FILEURL="https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip?_ga=2.76331925.1212129223.1523641571-1279700741.1523641571"
PACKAGES="wget unzip"

yum install -y -q $PACKAGES

cd /tmp
rm -rf terra*
wget $FILEURL
unzip terra*
mv terraform /usr/local/bin

