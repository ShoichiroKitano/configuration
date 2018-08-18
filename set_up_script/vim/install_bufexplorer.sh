#!/bin/bash

(
  cd ~/.vim/source
  rm -fr bufexplorer || true
  git clone https://github.com/jlanzarotta/bufexplorer.git
)

(
  cd
  rm .vim/plugin/bufexplorer.vim || true
  ln -s .vim/source/bufexplorer/plugin/bufexplorer.vim .vim/plugin/bufexplorer.vim
)
