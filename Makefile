
.PHONEY: all start stop snap rollback

all: help

help:    ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

start:
	@vagrant up node-master node-worker1 node-worker2

stop:
	@vagrant halt node-master node-worker1 node-worker2

status:
	@vagrant status

destroy:
	@vagrant destroy -f node-master node-worker1 node-worker2
	@rm -f infra/*.retry infra/join-command
