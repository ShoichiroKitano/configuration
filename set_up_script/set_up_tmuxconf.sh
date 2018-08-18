#!/bin/bash

set -eu

cd rm .tmux.conf || true
(cd $(dirname $0)
cd ../
ln -s $(pwd)/.tmux.conf ~/tmux.conf)
