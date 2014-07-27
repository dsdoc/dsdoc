#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"
readonly BASE=`pwd`

TARGET_DIR=../dsdoc.github.com

while getopts "t:" arg; do
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

# rebuild pages
make clean && make html &&
# clean page files
( cd $TARGET_DIR &&
    ls | fgrep -v README.md | fgrep -v CNAME | fgrep -v googleb167f650553a7c97.html | fgrep -v bdsitemap.txt |
    xargs rm -rf
) &&
# rebuild pages
cp -r _build/html/* "$TARGET_DIR" || {
    echo "Fail to make or cp!"
    exit 1
}

cd $TARGET_DIR

echo
echo ===============================================
git status
echo ===============================================
echo

if [ -d .git ]; then
    read -p "commit and push pages?" answer
    if [ "$answer" = "y" -o "$answer" = "Y" ]; then
        git add . && git ci -m update && git push || echo "Fail to commit!"
    fi
fi
