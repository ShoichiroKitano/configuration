#!/bin/bash

set -eu

cd $(dirname $0)
./install_vim_syntax.sh vim-vue https://github.com/posva/vim-vue.git
