#!/bin/bash

set -e

GO_VERSION=1.6.1
ENV_CONFIG=/etc/profile

curl https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /usr/local -zx
echo 'export PATH=$PATH:/usr/local/go/bin' >> ${ENV_CONFIG}
echo 'export GOPATH=$HOME/workspace' >> ${ENV_CONFIG}
source ${ENV_CONFIG}
mkdir -p /home/vagrant/workspace/src/github.com
chown -R vagrant: /home/vagrant/workspace
