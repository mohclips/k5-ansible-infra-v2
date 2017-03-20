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

ansible-playbook -i inventory/ docker_engine_stack.yml $ARGS
check_exitcode


