#!/bin/bash

set -e

DISTRIBUTION=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
DISTRIBUTION_CODE=$(lsb_release -sc | tr '[:upper:]' '[:lower:]')
DISTRIBUTION_RELEASE=$(lsb_release -sr)
DOCKER_VERSION=1.11.0

case "${DISTRIBUTION}" in
  ubuntu|debian)
    apt-get install -y -q apt-transport-https ca-certificates
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    echo deb https://apt.dockerproject.org/repo ${DISTRIBUTION}-${DISTRIBUTION_CODE} main > /etc/apt/sources.list.d/docker.list
    if [ ${DISTRIBUTION_CODE} = wheezy ] ; then
      echo deb http://http.debian.net/debian wheezy-backports main >> /etc/apt/sources.list.d/docker.list
    fi
		apt-get update
    apt-get install -y -q docker-engine=${DOCKER_VERSION}-0~${DISTRIBUTION_CODE}
    ;;
  centos)
    case "$(echo ${DISTRIBUTION_RELEASE} | awk -F'.' '{print $1}')" in
      6)
        rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
        curl -sSL https://get.docker.com/ | sh
        ;;
      7)
        yum install -y epel-release
        dockerrepo=/etc/yum.repos.d/docker-${DOCKER_VERSION}.repo
        echo "[docker-${DOCKER_VERSION}-repo]" > $dockerrepo
        echo "name=Docker ${DOCKER_VERSION} Repository" >> $dockerrepo
        echo "baseurl=https://yum.dockerproject.org/repo/main/centos/7/" >> $dockerrepo
        echo "enabled=1" >> $dockerrepo
        echo "gpgcheck=1" >> $dockerrepo
        echo "gpgkey=https://yum.dockerproject.org/gpg" >> $dockerrepo
        yum install docker-engine
        ;;
    esac
    
    service docker start
    chkconfig docker on
    ;;
esac
