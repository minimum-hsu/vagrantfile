rm -f ..\box\docker\*.box
mkdir ..\box\docker
vagrant destroy -f
vagrant up ubuntu-trusty64 && vagrant package ubuntu-trusty64 --output ../box/docker/ubuntu-trusty64.box
vagrant up ubuntu-vivid64 && vagrant package ubuntu-vivid64 --output ../box/docker/ubuntu-vivid64.box
vagrant up debian-jessie64 && vagrant package debian-jessie64 --output ../box/docker/debian-jessie64.box
vagrant up debian-wheezy64 && vagrant package debian-wheezy64 --output ../box/docker/debian-wheezy64.box
vagrant up centos-7 && vagrant package centos-7 --output ../box/docker/centos-7.box
vagrant up centos-6 && vagrant package centos-6 --output ../box/docker/centos-6.box