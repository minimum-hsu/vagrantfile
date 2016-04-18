#!/bin/bash

set -e

DISTRIBUTION=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
DISTRIBUTION_RELEASE=$(lsb_release -sr)
PYTHON3_VERSION=3.5.1

# Install python
case "${DISTRIBUTION}" in
  ubuntu|debian)
    apt-get build-dep python$(echo ${PYTHON3_VERSION} | awk -F"." '{print $1 "." $2}')
    curl https://www.python.org/ftp/python/${PYTHON3_VERSION}/Python-${PYTHON3_VERSION}.tgz | tar -C /tmp -zx
    cd /tmp/Python-${PYTHON3_VERSION}
    ./configure -prefix=/usr/local
    make && make altinstall
    ;;
  centos)
    # Build Python
    yum install yum-utils
    yum-builddep python3
    curl https://www.python.org/ftp/python/${PYTHON3_VERSION}/Python-${PYTHON3_VERSION}.tgz | tar -C /tmp -zx
    cd /tmp/Python-${PYTHON3_VERSION}
    ./configure -prefix=/usr/local
    make && make altinstall

    # Symbol Link
    ln -sf /usr/local/bin/python$(echo ${PYTHON3_VERSION} | awk -F"." '{print $1 "." $2}') /usr/bin/python

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
rm -fR /tmp/Python-${PYTHON3_VERSION}
