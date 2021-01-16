#!/bin/bash

if [ "$LOGNAME" != "root" ] ; then
  echo "
  
    You must be root to run this script.

"  
  exit
fi




# Update the OS
echo "
Update OS
"
apt update



# Upgrade the OS
echo "
Upgrade OS
"
apt -y upgrade


echo "
Install basic utils
"
# Install pieces I need
apt install -y git mlocate vim-* mailutils postfix xz-utils curl wget


# get npm
cd /tmp
echo "
Getting npm...
"
wget https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.xz 

echo "
uncompress file
"
xz -d -v node-v14.15.4-linux-x64.tar.xz

echo " 
extract file
"
tar xvf node-v14.15.4-linux-x64.tar

mv node-v14.15.4-linux-x64 /usr/local
ln -s /usr/local/node-v14.15.4-linux-x64 /usr/local/node


cp /etc/environment /etc/environment.o

OPATH=$PATH

. /etc/environment

PATH="$PATH:/usr/local/node/bin"
echo 'PATH=\"'"$PATH"\" > /etc/environment


echo "
Installing cordova
"
npm install -g cordova



echo "
Installing ionic
"
npm install -g @ionic/cli


ionic -v
