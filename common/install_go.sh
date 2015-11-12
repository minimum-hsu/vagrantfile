if [ -e '/etc/bash.bashrc' ] ; then
  CONFIG=/etc/bash.bashrc
elif [ -e '/etc/bashrc' ] ; then
  CONFIG=/etc/bashrc
else
  exit 1
fi
curl https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz | tar -C /usr/local -zx
echo 'export PATH=$PATH:/usr/local/go/bin' >> ${CONFIG}
echo 'export GOPATH=$HOME/workspace' >> ${CONFIG}
source /etc/bashrc
mkdir -p /home/vagrant/workspace/src/github.com