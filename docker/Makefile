OUT=../box/docker

all: clean ubuntu14 ubuntu15 debian7 debian8 centos6 centos7

ubuntu14: env
	@box=ubuntu-trusty64
	@vagrant up ${box} && vagrant package ${box} --output ${OUT}/${box}.box

ubuntu15: env
	@box=ubuntu-vivid64
	@vagrant up ${box} && vagrant package ${box} --output ${OUT}/${box}.box

debian7: env
	@box=debian-wheezy64
	@vagrant up ${box} && vagrant package ${box} --output ${OUT}/${box}.box

debian8: env
	@box=debian-jessie64
	@vagrant up ${box} && vagrant package ${box} --output ${OUT}/${box}.box

centos6: env
	@box=centos-6
	@vagrant up ${box} && vagrant package ${box} --output ${OUT}/${box}.box

centos7: env
	@box=centos-7
	@vagrant up ${box} && vagrant package ${box} --output ${OUT}/${box}.box

env:
	@mkdir -p ${OUT}

clean:
	@vagrant destroy -f
	@rm -f ${OUT}/*.box

