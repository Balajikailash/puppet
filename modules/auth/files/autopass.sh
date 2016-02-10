#!/bin/bash
# script will set root password
echo "Changing root password..."
echo "root|KingCobra@88" | chpasswd
if [ $# > 0 ];then
echo "Password change failed"
else
echo "root password has been changed successfully"
fi
exit
