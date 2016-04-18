#!/bin/bash

set -e

VIM_CONFIG=/home/vagrant/.vimrc

echo 'set tabstop=4' >> ${VIM_CONFIG}
echo 'set shiftwidth=4' >> ${VIM_CONFIG}
echo 'set softtabstop=4' >> ${VIM_CONFIG}
echo 'set expandtab' >> ${VIM_CONFIG}
echo 'set smarttab' >> ${VIM_CONFIG}
echo 'set autoindent' >> ${VIM_CONFIG}
chown vagrant: ${VIM_CONFIG}
