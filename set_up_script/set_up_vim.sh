#!/bin/bash

set -eu

cd $(dirname $0)

./vim/set_up_vimrc.sh
./vim/set_up_plugin_dir.sh
./vim/install_bufexplorer.sh
./vim/install_kotlin_vim.sh
./vim/install_vim_elixir.sh
./vim/install_vim_vue.sh
./vim/install_vim_svelte.sh
./vim/install_typescript_vim.sh
./vim/install_tag_explorer.sh
