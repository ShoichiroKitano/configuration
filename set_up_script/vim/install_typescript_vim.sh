#!/bin/bash

set -eu

cd $(dirname $0)
./install_vim_syntax.sh typescript-vim https://github.com/leafgarland/typescript-vim.git
