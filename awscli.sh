#!/bin/bash
# Once python3.6 is installed this script will install boto3 and awscli


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
        echo "Install python3.6 before running this script"
        echo "####################################################"
fi


echo
echo "####################################################"
echo "Installing boto3 and awscli"
pip3.6 install boto3
pip3.6 install awscli
echo "Installation complete"
echo "Run aws configure for credentials and default region"
echo "####################################################"

