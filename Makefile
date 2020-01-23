
.PHONEY: all start stop snap rollback

all: help

help:    ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

# Build binaries

build: $(BIN_DIR)/controller

$(BIN_DIR)/controller:
	docker run --rm -it -v "$(GO_PATH)":/gopath -v "$(SRC_DIR)":/app -e "GOPATH=/gopath" -w /app golang:latest sh -c 'CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o bin/controller nimbo.com/controller'

# Build Docker images

image: nimbo/controller

nimbo/controller:
	@echo Building nimbo/controller image
	docker build -t nimbo/controller:$(ECONUMI_VERSION) -f Dockerfile.controller .

start:
	@vagrant up node-master node-worker1 node-worker2

stop:
	@vagrant halt node-master node-worker1 node-worker2

status:
	@vagrant status

destroy:
	@vagrant destroy -f node-master node-worker1 node-worker2
	@rm -f infra/*.retry infra/join-command
