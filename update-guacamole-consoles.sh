#!/bin/bash
ansible-playbook -i ./openstack_dynamic_inventory.py update-guacamole-consoles.yml $@

