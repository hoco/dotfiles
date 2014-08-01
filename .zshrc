export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export PATH=/opt/local/bin:opt/local/sbin:/usr/local/mysql/bin:/Applications/android-sdk/platform-tools:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

alias ls='ls -G'
alias be='bundle exec'

if [[ -s $HOME/.pythonbrew/etc/bashrc ]] ; then source $HOME/.pythonbrew/etc/bashrc; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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

# scm info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# peco-select-history
# See: http://shibayu36.hatenablog.com/entry/2014/06/27/223538
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# agvim
# See: http://qiita.com/fmy/items/b92254d14049996f6ec3
function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
