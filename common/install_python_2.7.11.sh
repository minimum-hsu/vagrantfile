#!/bin/bash

set -e

DISTRIBUTION=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
DISTRIBUTION_RELEASE=$(lsb_release -sr)
PYTHON2_VERSION=2.7.11

# Install python
case "${DISTRIBUTION}" in
  ubuntu|debian)
    apt-get install -y build-essential checkinstall
    apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
    curl https://www.python.org/ftp/python/${PYTHON2_VERSION}/Python-${PYTHON2_VERSION}.tgz | tar -C /tmp -zx
    cd /tmp/Python-${PYTHON2_VERSION}
    ./configure -prefix=/usr/local
    make && make altinstall
    ;;
  centos)
    yum groupinstall -y "Development"
    yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel
    curl https://www.python.org/ftp/python/${PYTHON2_VERSION}/Python-${PYTHON2_VERSION}.tgz | tar -C /tmp -zx
    cd /tmp/Python-${PYTHON2_VERSION}
    ./configure -prefix=/usr/local
    make && make altinstall

    # Symbol Link
    ln -sf /usr/local/bin/python$(echo ${PYTHON2_VERSION} | awk -F"." '{print $1 "." $2}') /usr/bin/python

    # Reset yum
    YUM=$(which yum) || true
    YUM_BACKUP=${YUM}.bak
    if [ ! -f ${YUM_BACKUP} ]; then
      mv ${YUM} ${YUM_BACKUP}
      case "$(echo ${DISTRIBUTION_RELEASE} | awk -F'.' '{print $1}')" in
        6) sed -e '1c #!/usr/bin/python2.6' ${YUM_BACKUP} > ${YUM} ;;
        7) sed -e '1c #!/usr/bin/python2.7' ${YUM_BACKUP} > ${YUM} ;;
      esac
      chmod +x ${YUM}
    fi
    ;;
esac
rm -fR /tmp/Python-${PYTHON2_VERSION}

# Install python-pip
PIP=$(which pip) || true
if [ ! -z ${PIP} ]; then
  pip install -U setuptools pip
else
  curl -s https://bootstrap.pypa.io/get-pip.py | python
fi
#if [ -z ${PIP} ]; then
#  yum install -y python-pip
#else
#  pip2 install -U setuptools pip  
#fi
