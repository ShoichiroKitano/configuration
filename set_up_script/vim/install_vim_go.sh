#!/bin/bash

set -eu

(
  cd ~/.vim/source
  rm -fr vim-go || true
  git clone https://github.com/fatih/vim-go.git
)

(
  cd ~/.vim/syntax
  rm ~/.vim/syntax/go.vim || true
  ln -s ../source/vim-go/syntax/go.vim go.vim

  cd ~/.vim/indent
  rm ~/.vim/indent/go.vim || true
  ln -s ../source/vim-go/indent/go.vim go.vim

  cd ~/.vim/ftdetect
  rm ~/.vim/ftdetect//gofiletype.vim || true
  ln -s ../source/vim-go/ftdetect/gofiletype.vim gofiletype.vim
)
