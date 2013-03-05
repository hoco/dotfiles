export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export PATH=/opt/local/bin:opt/local/sbin:/usr/local/mysql/bin:/Applications/android-sdk/platform-tools:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

alias ls='ls -G'

if [[ -s $HOME/.pythonbrew/etc/bashrc ]] ; then source $HOME/.pythonbrew/etc/bashrc; fi

autoload -U compinit
compinit
setopt autopushd
setopt pushd_ignore_dups
setopt auto_cd
setopt list_packed
setopt list_types

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt EXTENDED_HISTORY

PROMPT="[%n@%m %~] %(!.#.$) "
PROMPT2="%_> "
SPROMPT="correct: %R -> %r [nyae]? "
