#!/bin/bash
#######################################################################################
### This scripts will install brackets editor on RHEL/Centos
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
echo "Installing brackets editor"
yum install yum-plugin-copr -y
yum copr enable jgillich/brackets -y
yum install brackets -y 
echo "Done"
echo "#############################################################"
sleep 3
