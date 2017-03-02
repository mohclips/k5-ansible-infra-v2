#!/bin/bash
ARGS=$@
echo ARGS: $ARGS

ansible-playbook -i inventory/ network_stack.yml $ARGS

