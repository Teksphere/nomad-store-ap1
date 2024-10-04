#!/bin/bash

# tell bash to print out the statements as they are being executed so that we can see them running
set -x

# Install packer
wget https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip
unzip packer_1.5.6_linux_amd64.zip
mv packer /usr/local/bin/
packer version