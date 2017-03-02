#!/bin/bash

check_exitcode() {
ERR=$?
if [ $ERR -ne 0 ] ; then
	echo "Previous playbook failed. Exiting..."
	exit 1
fi
}

##############################################################################
ARGS=$@
echo ARGS: $ARGS

if [ ! -e ./openstack_dynamic_inventory.py ] ; then
	echo "Openstack Dynamic Inventory Missing, Exiting..."
	exit 1
fi	


echo "This first script will ask for your SUDO password, as this is needed to update /etc/hosts"
ansible-playbook --ask-become-pass -i inventory/ jumpserver_stack.yml $ARGS
check_exitcode

echo "Sleeping a while to allow Openstack to catch up, services to start up fully"
# this could be a lot shorter, but for some reason on some days it is not.
sleep 60

##echo "SSH Controlpath updates - to allow SSH pipelining"
##ls ~/.ssh/
##ssh -O check -o controlpath=~/.ssh/ansible-%r@%h:%p k5user@nx2-uk-1b-jumpserver
##ssh -O exit -o controlpath=~/.ssh/ansible-%r@%h:%p k5user@nx2-uk-1b-jumpserver

echo "PLAY #2 - install guacamole"
ansible-playbook -i inventory/ guacamole_stack.yml $ARGS 
check_exitcode


echo "PLAY #3 - update guacamole consoles"
ansible-playbook -i ./openstack_dynamic_inventory.py update-guacamole-consoles.yml
check_exitcode

