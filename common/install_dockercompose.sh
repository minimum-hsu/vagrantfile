YUM=$(which yum)
APT=$(which apt-get)
if [ ! -z ${YUM} ]; then
  sudo yum install -y python-pip
elif [ ! -z ${APT} ]; then
  sudo apt-get install -y python-pip
fi

pip install -U pyyaml
pip install -U functools32
pip install -U docker-compose
