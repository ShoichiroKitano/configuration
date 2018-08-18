#!/bin/bash

(
  cd ~/.vim/source
  rm -fr bufexplorer || true
  git clone https://github.com/jlanzarotta/bufexplorer.git
)

(
  rm ~/.vim/plugin/bufexplorer.vim || true
  cd ~/.vim/plugin
  ln -s ../source/bufexplorer/plugin/bufexplorer.vim bufexplorer.vim
)
