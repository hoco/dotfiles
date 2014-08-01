#!/bin/sh
cd $(dirname $0)
files=(.vim .vimrc .zshrc .zprofile .gvimrc .tmux.conf .zprofile .pryrc .tigrc)

for dotfile in ${files[@]} 
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        echo "ln -Fis "$PWD/$dotfile" $HOME"
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
