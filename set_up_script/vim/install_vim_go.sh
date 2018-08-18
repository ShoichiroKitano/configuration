#!/bin/bash

set -eu

(
  cd ~/.vim/source
  rm -fr vim-go || true
  git clone https://github.com/fatih/vim-go.git
)

(
  cd
  rm .vim/syntax/go.vim || true
  rm .vim/indent/go.vim || true
  rm .vim/ftdetect//gofiletype.vim || true
  VIM_GO_PATH='.vim/source/vim-go'
  ln -s $VIM_GO_PATH/syntax/go.vim .vim/syntax/go.vim
  ln -s $VIM_GO_PATH/indent/go.vim .vim/indent/go.vim
  ln -s $VIM_GO_PATH/ftdetect/gofiletype.vim .vim/ftdetect//gofiletype.vim
)
