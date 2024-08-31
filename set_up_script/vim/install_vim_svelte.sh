#!/bin/bash

set -eu

cd $(dirname $0)
./install_vim_syntax.sh vim-svelte https://github.com/evanleck/vim-svelte.git
