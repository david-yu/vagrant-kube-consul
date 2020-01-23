Consul on Kubernetes demo
=====

A quick way to provision a Kubernetes cluster on your laptop and also deploy Consul.

Prerequisites (Install before building)
---------------------------------------

- [VirtualBox 6.0.x](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant 2.2.x](https://www.vagrantup.com/downloads.html)
- [Ansible 2.9.x](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#from-pip)

Getting Started
---------------

The easiest way to get started is to provision a cluster with the commands below:
```
# Create kube cluster
make start
# Destroy kube cluster
make destroy
```
