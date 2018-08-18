#!/bin/bash

set -eu

(
  cd ~/.vim/source
  rm -fr vim-elixir || true
  git clone https://github.com/elixir-editors/vim-elixir.git
)

(
  cd ~/.vim/syntax
  rm ~/.vim/syntax/elixir.vim || true
  ln -s ../source/vim-elixir/syntax/elixir.vim elixir.vim

  cd ~/.vim/indent
  rm ~/.vim/indent/elixir.vim || true
  ln -s ../source/vim-elixir/indent/elixir.vim elixir.vim

  cd ~/.vim/ftdetect
  rm ~/.vim/ftdetect/elixir.vim || true
  ln -s ../source/vim-elixir/ftdetect/elixir.vim elixir.vim
)
