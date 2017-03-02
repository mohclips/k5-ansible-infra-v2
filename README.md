# Intro

This git repository contains examples of how to create infrastructure as code on the Fujitsu K5 Cloud.

Basically, in my day job I help people with Intrafructure as Code, automation and other such things.  I wrote these modules to help people access K5 more readily.  Plus it's a bit of fun. ;)

# Cloning

When you clone make sure you use the --recursive parameter to pull the sub-module down as well.

eg. ```git clone --recursive https://github.com/mohclips/k5-ansible-infra.git my_project_copy```

There is a great blog on submodules here https://github.com/blog/2104-working-with-submodules

# Requirements

There is a required Ansible role (not yet on Ansible Galaxy) guacamole-jumpserver

you need to clone this from my git repo.

```git clone https://github.com/mohclips/guacamole-jumpserver.git roles/guacamole-jumpserver```

This will enable you to install the Apache Guacamole HTML5 jumpserver - highly recommended


# Usage

You will notice that the submodule ```k5-ansible-modules``` is included.  This is the actual modules written in python to communicate with the K5 API.

When you clone, make sure you pull down the sub-module as well. (as above)
Run ```git submodule update --init --recursive``` if it is empty.

You can then do either of the following;
* create a symbolic-link ```ln -s k5-ansible-modules/library/ library```
* update your ```ANSIBLE_LIBRARY``` environment variable. see http://docs.ansible.com/ansible/dev_guide/developing_modules.html#module-paths
* update the ```library=``` parameter in your ```ansible.cfg``` (this is colon delimited). My favorite.

If I can find a better way of doing this, I will. But at present this is the best way to keep the two apart, to allow others to just grab the modules. 

Then:

Update ```vars/all.yml``` with your infrastructure settings.

And run the playbook  ```provision_infra.yml```

## Building things

There are anumber of shell scripts called build-something.sh  These will enable you to build things :)

# Online API Guides

http://www.fujitsu.com/global/solutions/cloud/k5/guides/ 


