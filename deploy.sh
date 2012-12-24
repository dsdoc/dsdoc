#!/bin/bash

cd `dirname $0`
BASE=`pwd`

TARGET_DIR=/cygdrive/e/CodeRepository/open/dsdoc-pages

make html && rm -rf $TARGET_DIR/* && cp -r _build/html/* $TARGET_DIR &&
git add . && git ci -m update && git push


