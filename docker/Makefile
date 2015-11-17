OUT=../box/docker

all: clean ubuntu14 ubuntu15 debian7 debian8 centos6 centos7

ubuntu14: env
	@vagrant up ubuntu-trusty64 && vagrant package ubuntu-trusty64 --output ${OUT}/ubuntu-trusty64.box

ubuntu15: env
	@vagrant up ubuntu-vivid64 && vagrant package ubuntu-vivid64 --output ${OUT}/ubuntu-vivid64.box

debian7: env
	@vagrant up debian-wheezy64 && vagrant package debian-wheezy64 --output ${OUT}/debian-wheezy64.box

debian8: env
	@vagrant up debian-jessie64 && vagrant package debian-jessie64 --output ${OUT}/debian-jessie64.box

centos6: env
	@vagrant up centos-6 && vagrant package centos-6 --output ${OUT}/centos-6.box

centos7: env
	@vagrant up centos-7 && vagrant package centos-7 --output ${OUT}/centos-7.box

env:
	@mkdir -p ${OUT}

clean:
	@vagrant destroy -f
	@rm -f ${OUT}/*.box

