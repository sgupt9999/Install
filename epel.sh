#!/bin/bash
# This scripts contains link to install the EPEL (Extra Packages for Enterprise Linux) repo

# Start of user input
ARCH_64BIT="yes"
#ARCH_64BIT="no"
# Wasnt able to find the repo for 32 bit machines, but can install the 64 bit after making a change to /etc/yum.repos.d/epel.repo
# End of user input

if [[ $EUID != "0" ]]
then
	echo "ERROR. Need to have root privileges to run this script"
	exit 1
fi

echo "Installing EPEL repo....."
yum install -y -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo "Done"

if [[ $ARCH_64BIT == "no" ]]
then
	echo "This is a 32 bit machine. Changing the architecture in /etc/yum.repos.d/epel.rep to 64 bit so it works properly"
	sed -i 's/$basearch/x86_64/g' /etc/yum.repos.d/epel.repo
	sed -i 's/$basearch/x86_64/g' /etc/yum.repos.d/epel-testing.repo

fi
