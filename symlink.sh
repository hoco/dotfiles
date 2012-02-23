#!/bin/sh
cd $(dirname $0)
for dotfile in .vim*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
        fi
done
