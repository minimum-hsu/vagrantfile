rm -f ..\box\docker+go\*.box
mkdir ..\box\docker+go
vagrant destroy -f
vagrant up ubuntu-trusty64 && vagrant package ubuntu-trusty64 --output ../box/docker+go/ubuntu-trusty64.box
vagrant up ubuntu-vivid64 && vagrant package ubuntu-vivid64 --output ../box/docker+go/ubuntu-vivid64.box
vagrant up debian-jessie64 && vagrant package debian-jessie64 --output ../box/docker+go/debian-jessie64.box
vagrant up debian-wheezy64 && vagrant package debian-wheezy64 --output ../box/docker+go/debian-wheezy64.box
vagrant up centos-7 && vagrant package centos-7 --output ../box/docker+go/centos-7.box
vagrant up centos-6 && vagrant package centos-6 --output ../box/docker+go/centos-6.box