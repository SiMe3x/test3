#!/bin/bash

#Check if you make sudo
if [ $USER != "root" ]
then
echo "you need make \"sudo $0\" "
exit $?
fi


