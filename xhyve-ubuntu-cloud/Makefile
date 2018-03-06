.DEFAULT_GOAL = help
SHELL:=/bin/bash


.PHONY:	docker prep download

define HELP

Global make targets:

  help:              this help
  start:             start ubuntu VM 
  clean:             cleanup workspace

endef


export HELP

help:
	@echo "$$HELP"

download: imgs imgs/xenial-server-cloudimg-amd64-disk1.img imgs/xenial-server-cloudimg-amd64-vmlinuz-generic imgs/xenial-server-cloudimg-amd64-initrd-generic

prep: download stor.img 

imgs:
	@mkdir imgs

imgs/xenial-server-cloudimg-amd64-disk1.img: 
	@cd imgs; curl -# -O https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img

imgs/xenial-server-cloudimg-amd64-disk1.raw: 
	@cd imgs; qemu-img convert xenial-server-cloudimg-amd64-disk1.img xenial-server-cloudimg-amd64-disk1.raw

imgs/xenial-server-cloudimg-amd64-vmlinuz-generic:
	@cd imgs; curl -# -O https://cloud-images.ubuntu.com/xenial/current/unpacked/xenial-server-cloudimg-amd64-vmlinuz-generic
	
imgs/xenial-server-cloudimg-amd64-initrd-generic:
	@cd imgs; curl -# -O https://cloud-images.ubuntu.com/xenial/current/unpacked/xenial-server-cloudimg-amd64-initrd-generic


stor.img: imgs/xenial-server-cloudimg-amd64-disk1.raw
	@cp imgs/xenial-server-cloudimg-amd64-disk1.raw stor.img
	@qemu-img resize -f raw stor.img +8G 

start: prep
	@sudo ./node_start.sh

clean:
	@rm stor.img 

