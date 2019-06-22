#!/bin/bash
#######################################################################################
### This scripts will install visual studion
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
echo "Installing cwvisualstudio"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
sudo yum install code -y
echo "Done"
echo "#############################################################"
sleep 3
