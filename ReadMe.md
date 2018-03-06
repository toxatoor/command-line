# Command line tricks and enhancements. 

## zmodem

x/y/z-modem with iTerm2 (cloned from [mmastrac/iterm2-zmodem](https://github.com/mmastrac/iterm2-zmodem))

## git-bash

Git helpers for bash. Shows the current branch in PS1 prompt with the clean/dirty status, adds key bindings: 
 - Ctrl-G + f: git fetch -a -p 
 - Ctrl-G + r: git reset origin/master --hard 
 - Ctrl-G + b: git rebase -i origin/master 
 - Ctrl-G + p: git push origin ${CURRENT_BRANCH} 
 - Ctrl-G + c: cleans command line and types there 'git commit -m \"' 

## tmux

Current tmux config for working with bastion host. Connects to bastion, opens all windows and attaches each to running screen session at bastion host with just one keypress - Ctrl-B + O 


## xhyve-ubuntu-cloud 

Simple wrapper to run cloud Ubuntu 16.04 under Hypervisor.framework with xhyve. 
Requires modern Mac OS, xhyve, qemu-img and make. 
`make start` downloads all required images, converts, and starts Ubuntu VM provisioning via cloud-init from this repo. 
Note, that xhyve requres root access to run network stack, therefore `make start` will ask for a sudo password. 
