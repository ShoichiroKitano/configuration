#!/bin/bash

(
  cd ~/.vim/source
  rm -fr kotlin-vim || true
  git clone https://github.com/udalov/kotlin-vim.git
)

(
  cd
  rm .vim/syntax/kotlin.vim || true
  rm .vim/indent/kotlin.vim || true
  rm .vim/ftdetect//kotlin.vim || true
  KOTLIN_VIM_PATH='.vim/source/kotlin-vim'
  ln -s $KOTLIN_VIM_PATH/syntax/kotlin.vim .vim/syntax/kotlin.vim
  ln -s $KOTLIN_VIM_PATH/indent/kotlin.vim .vim/indent/kotlin.vim
  ln -s $KOTLIN_VIM_PATH/ftdetect/kotlin.vim .vim/ftdetect/kotlin.vim
)
