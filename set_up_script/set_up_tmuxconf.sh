#!/bin/bash

set -eu

rm ~/.tmux.conf || true
(cd $(dirname $0)
cd ../
ln -s $(pwd)/tmux.conf ~/.tmux.conf)
