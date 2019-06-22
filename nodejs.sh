#!/bin/bash
#######################################################################################
### This scripts will install google chrome
#######################################################################################

if [[ $EUID != "0" ]]
then
	echo
	echo "######################################################"
	echo "ERROR. Need to have root privileges to run this script"
	echo "######################################################"
	exit 1
fi

echo
echo "#############################################################"
echo "Installing nodejs"
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
yum install nodejs -y
node --version
npm --version
echo "Done"
echo "#############################################################"
sleep 3
