#!/bin/bash
# This script will install the atom editor on this machine
# This gives a dependency error on RHEL which I havent been able to fix yet
# Tested and works w/o a problem on Centos



if [[ $EUID != 0 ]]
then
	echo
	echo "###########################################################"
	echo "ERROR. You need to have root privileges to run this script"
	echo "###########################################################"
	exit 1
else
	echo
	echo "####################################################"
	echo "This script will install atom editor on this machine"
	echo "It gives a number of dependency errors on RHEL, but"
	echo "works fine on Centos"
	echo "####################################################"
fi

INSTALLPACKAGES="wget git"

echo
echo "#####################"
echo "Installing atom"
yum install -y $INSTALLPACKAGES
wget https://github.com/atom/atom/releases/download/v1.29.0/atom.x86_64.rpm
yum install -y atom.x86_64.rpm
rm -rf atom.x86_64.rpm
echo "Installation complete"
echo "#####################"

	
