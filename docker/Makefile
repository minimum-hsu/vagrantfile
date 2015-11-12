all: ubuntu14 ubuntu15 debian7 debian8 centos6 centos7
ubuntu14:
	@box=ubuntu-trusty64
	@vagrant up ${box} && vagrant package ${box} --output ${box}.box
ubuntu15:
	@box=ubuntu-vivid64
	@vagrant up ${box} && vagrant package ${box} --output ${box}.box
debian7:
	@box=debian-wheezy64
	@vagrant up ${box} && vagrant package ${box} --output ${box}.box
debian8:
	@box=debian-jessie64
	@vagrant up ${box} && vagrant package ${box} --output ${box}.box
centos6:
	@box=centos-6
	@vagrant up ${box} && vagrant package ${box} --output ${box}.box
centos7:
	@box=centos-7
	@vagrant up ${box} && vagrant package ${box} --output ${box}.box
clean:
	@rm -f *.box
