#!/bin/bash

set -eu

REPO_NAME=$1
REPO_URL=$2

(
  cd ~/.vim/source
  rm -fr $REPO_NAME || true
  git clone $REPO_URL
)

(
  for dir_type in syntax indent ftdetect
  do
    cd ~/.vim/$dir_type
    ls -l ~/.vim/source/$REPO_NAME/$dir_type | awk 'NR != 1 { print $9 }' | xargs -I% sh -c "rm ~/.vim/$dir_type/% || true"
    ls -l ~/.vim/source/$REPO_NAME/$dir_type | awk 'NR != 1 { print $9 }' | xargs -I% ln -s ../source/$REPO_NAME/$dir_type/% %
  done
)
