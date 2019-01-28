#!/bin/bash
# This script will install the atom editor on this machine



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


echo
echo "#####################"
echo "Installing atom"

rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey

rm -rf /etc/yum.repos.d/atom.repo > /dev/null 2>&1
cat >> /etc/yum.repos.d/atom.repo << EOF
[Atom]
name=Atom Editor
baseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch
enabled=1
gpgcheck=0
repo_gpgcheck=1
gpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey
EOF

yum install -y atom
echo "Installation complete"
echo "#####################"

	
