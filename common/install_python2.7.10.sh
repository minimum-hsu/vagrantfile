# Build Python
yum groupinstall -y "Development"
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel
curl https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz | tar -C /tmp -zx
cd /tmp/Python-2.7.10
./configure -prefix=/usr/local
make && make altinstall

# Symbol Link
ln -sf /usr/local/bin/python2.7 /usr/bin/python

# Install Python pip
curl https://pypi.python.org/packages/source/s/setuptools/setuptools-18.5.tar.gz | tar -C /tmp -zx
cd /tmp/setuptools-18.5
python setup.py install
easy_install pip

# Reset yum
mv /usr/bin/yum /usr/bin/yum.bak
sed -e '1c #!/usr/bin/python2.6' /usr/bin/yum.bak > /usr/bin/yum
chmod +x /usr/bin/yum