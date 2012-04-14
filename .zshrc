export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export PATH=/opt/local/bin:opt/local/sbin/:/usr/local/mysql/bin/:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

alias ls='ls -G'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
if [[ -s $HOME/.pythonbrew/etc/bashrc ]] ; then source $HOME/.pythonbrew/etc/bashrc; fi
