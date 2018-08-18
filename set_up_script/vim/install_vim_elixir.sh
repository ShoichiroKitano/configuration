#!/bin/bash

set -eu

cd $(dirname $0)
./install_vim_syntax.sh vim-elixir https://github.com/elixir-editors/vim-elixir.git
