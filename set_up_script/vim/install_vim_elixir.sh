#!/bin/bash

(
  cd ~/.vim/source
  rm vim-elixir.git || true
  https://github.com/elixir-editors/vim-elixir.git
)

(
  cd
  rm .vim/syntax/elixir.vim || true
  rm .vim/indent/elixir.vim || true
  rm .vim/ftdetect/elixir.vim || true
  VIM_ELIXIR_PATH='.vim/source/vim-elixir'
  ln -s $VIM_ELIXIR_PATH/syntax/elixir.vim .vim/syntax/elixir.vim
  ln -s $VIM_ELIXIR_PATH/indent/elixir.vim .vim/indent/elixir.vim
  ln -s $VIM_ELIXIR_PATH/ftdetect/elixir.vim .vim/ftdetect/elixir.vim
)
