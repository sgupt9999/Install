#!/bin/bash
# This script will clean up and free up space
# based on code from https://www.getpagespeed.com/server-setup/clear-disk-space-centos



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
	echo "This script will clean up space on the hard drive"
	echo "####################################################"
fi


echo
echo "#####################"
echo "Cleaning up"

sudo journalctl --vacuum-time=1s #This will clear all journald log files
yum -y install yum-utils #Install yum-utils if not already installed
find /var -name "*.log" \( \( -size +50M -mtime +7 \) -o -mtime +30 \) -exec truncate {} --size 0 \; #This will truncate any *.log files on the volime /var that are either older than 7 days and greater than 50M or older than 30 days
yum clean all #Cleanup yum caches
rm -rf /var/cache/yum #Free up space taken by orphaned data from disabled or removed repo
package-cleanup --quiet --leaves | xargs yum remove -y #Remove orphan packages
(( $(rpm -E %{rhel}) >= 8 )) && dnf remove $(dnf repoquery --installonly --latest-limit=-1 -q)
(( $(rpm -E %{rhel}) <= 7 )) && package-cleanup --oldkernels --count=1 #Just keep the latest kernel
rm -rf /root/.composer/cache
rm -rf /home/*/.composer/cache #Remove composer cache
find -regex ".*/core\.[0-9]+$" -delete #Remove coredumps
rm -rf /root/.npm /home/*/.npm /root/.node-gyp /home/*/.node-gyp /tmp/npm-* #Remove node.js caches

echo "Cleanup Complete"
echo "#####################"

	
