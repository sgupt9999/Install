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
echo "Installing Google chrome"
rm -rf google-chrome-stable_current_x86_64.rpm
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install ./google-chrome-stable_current_x86_64.rpm -y
echo "Done"
echo "#############################################################"
sleep 3
