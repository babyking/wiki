#!/bin/bash
set -e
set -x

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

mkdocs gh-deploy
