#!/bin/bash

cd `dirname $0`
BASE=`pwd`

p=/cygdrive/e/CodeRepository/open/dsdoc-pages

# clean page files 
( cd $p && ls | fgrep -v README.md | fgrep -v CNAME | fgrep -v googleb167f650553a7c97.html | fgrep -v bdsitemap.txt | xargs rm -rf )

# rebuild pages

make clean && make html

# copy files
cp -r _build/html/* $p

cd $p

echo +++++++++++++++++++++++++++++++++++++++++++++++
git st
echo +++++++++++++++++++++++++++++++++++++++++++++++

read -p "push pages?" answer

if [ "$answer" = "n" -o "$answer" = "N" ] ; then
    exit
fi

git add . && git ci -m "update" && git push
