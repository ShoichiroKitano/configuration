#!/bin/bash

set -eu

cd $(dirname $0)
./install_vim_syntax.sh kotlin-vim https://github.com/udalov/kotlin-vim.git
