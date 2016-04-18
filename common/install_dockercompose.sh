#!/bin/bash

# Install python-pip
PIP=$(which pip) || true
if [ ! -z ${PIP} ]; then
  pip install -U setuptools pip
else
  curl -s https://bootstrap.pypa.io/get-pip.py | python
fi

pip install -U pyyaml
pip install -U functools32
pip install -U docker-compose
