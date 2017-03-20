# Intro

This git repository contains examples of how to create infrastructure as code on the Fujitsu K5 Cloud.

Basically, in my day job I help people with Intrafructure as Code, automation and other such things.  I wrote these modules to help people access K5 more readily.  Plus it's a bit of fun. ;)


This is a living piece of code, i expect it will never be finished :)

# Cloning

When you clone make sure you use the --recursive parameter to pull the sub-module down as well.

eg. ```git clone --recursive https://github.com/mohclips/k5-ansible-infra.git my_project_copy```

There is a great blog on submodules here https://github.com/blog/2104-working-with-submodules

# Requirements

There is a required Ansible role (not yet on Ansible Galaxy) guacamole-jumpserver

you need to clone this from my git repo.

```git clone https://github.com/mohclips/guacamole-jumpserver.git roles/guacamole-jumpserver```

This will enable you to install the Apache Guacamole HTML5 jumpserver - highly recommended

You will also need to address the ```ansible-requirements.yml``` to install the Docker Swarm.

## Pipelining

Note that I have used Ansible Pipelining mode.  This enables a much faster build.   This also means that the NOTTY function in sudoers needs to be turned off, for the user that Ansible uses.   This is done at build time of each compute instance, see the ```user_data/``` folder for more.

## SSH Proxy Access

Note that SSH Proxy is utilised by ProxyCommand function.  This enables Ansible to proxy it's connectivity through the Jump Server to any of the non-Public facing compute instances.
For this same reason, that is why CentOS is used as the Jump Server, where as everything else is on Ubuntu.  This is due to a kernel issue in Ubuntu 14.04 that breaks the SSH mutex and you loose connectivity. (not good and as yet not fixed by Canonical).

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

Update ```vars/all.yml``` and ```inventory\all``` with your infrastructure settings.

And run the bash shell script ```build-all.yml```

## Building things

There are anumber of shell scripts called build-something.sh  These will enable you to build things :)

# Online API Guides

http://www.fujitsu.com/global/solutions/cloud/k5/guides/ 


