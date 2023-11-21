#!/bin/bash

(
  cd ~/.vim/source
  rm -fr tag-explorer.vim || true
  git clone git@github.com:ShoichiroKitano/tag-explorer.vim.git
)

(
  rm ~/.vim/plugin/tag-explorer.vim || true
  cd ~/.vim/plugin
  ln -s ../source/tag-explorer.vim/plugin/tag-explorer.vim tag-explorer.vim
)
