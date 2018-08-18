#!/bin/bash

set -eu

rm ~/.vimrc || true
(cd $(dirname $0)
cd ../../
ln -s $(pwd)/vimrc ~/.vimrc)
