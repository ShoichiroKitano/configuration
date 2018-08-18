#!/bin/bash

set -eu

(
  cd ~/.vim/source
  rm -fr kotlin-vim || true
  git clone https://github.com/udalov/kotlin-vim.git
)

(
  cd ~/.vim/syntax
  rm ~/.vim/syntax/kotlin.vim || true
  ln -s ../source/kotlin-vim/syntax/kotlin.vim kotlin.vim

  cd ~/.vim/indent
  rm ~/.vim/indent/kotlin.vim || true
  ln -s ../source/kotlin-vim/indent/kotlin.vim kotlin.vim

  cd ~/.vim/ftdetect
  rm ~/.vim/ftdetect/kotlin.vim || true
  ln -s ../source/kotlin-vim/ftdetect/kotlin.vim kotlin.vim
)
