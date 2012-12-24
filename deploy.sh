#!/bin/bash

cd `dirname $0`
BASE=`pwd`

TARGET_DIR=../pages

while getopts "t:" arg
do
        case $arg in
             t)
                if [ -n "$OPTARG" ]; then
                    TARGET_DIR=$OPTARG
                fi
                ;;
             ?)
                echo "unkonw argument"
                exit 1
                ;;
        esac
done

make html && rm -rf $TARGET_DIR/* && cp -r _build/html/* $TARGET_DIR

result=$?
if [ $result -ne 0 ] ; then
	echo fail to make or cp!
	exit $result
fi

cd $TARGET_DIR
if [ -a .git ]; then
    git add . && git ci -m update && git push
fi


