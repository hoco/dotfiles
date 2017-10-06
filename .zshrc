export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export GOPATH=$HOME/.go
export PATH=/opt/local/bin:opt/local/sbin:/usr/local/mysql/bin:/Applications/android-sdk/platform-tools:$HOME/.nodebrew/current/bin:$GOPATH/bin:/usr/local/bin:/opt/chefdk/bin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
export EDITOR=/usr/bin/vim

alias ls='ls -G'
alias be='bundle exec'

if [[ -s $HOME/.pythonbrew/etc/bashrc ]] ; then source $HOME/.pythonbrew/etc/bashrc; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

bindkey -e

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

# direnv
eval "$(direnv hook zsh)"

if [ -e /usr/local/google-cloud-sdk ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source '/usr/local/google-cloud-sdk/path.zsh.inc'
  # The next line enables shell command completion for gcloud.
  source '/usr/local/google-cloud-sdk/completion.zsh.inc'
fi

# See: http://ukstudio.jp/2015/03/26/open_pull_request/
function find-pr() {
  local parent=$2||'master'
  git log $1..$2 --merges --ancestry-path --reverse --oneline | head -n1
}

function find-pr-open() {
  local pr="$(find-pr $1 $2 | awk '{print substr($5, 2)}')"
  local repo="$(git config --get remote.origin.url | sed 's/git@github.com://' | sed 's/\.git$//')"
  open "https://github.com/${repo}/pull/${pr}"
}

# zsh-completions
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
