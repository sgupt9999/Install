#!/bin/bash
# This script will install microsoft repo and then powershell on this machine

# Start of user input
# End of user input

if [[ $EUID != "0" ]]
then
	echo "ERROR. Need to have root privileges to run this script"
	exit 1
else
	echo "This script will install powershell on this machine"
fi

echo "Installing Powershell...."
curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo
yum install powershell -y
echo "Done"
