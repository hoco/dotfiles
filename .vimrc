"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vim/backup
"タブの代わりに空白文字を挿入する
set expandtab
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"beep音を画面フラッシュにする
set visualbell
"分割時は右に分割
set splitright

syntax on
filetype on

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

"vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
filetype plugin indent on     " required

"neocomplcache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

"ディレクトリ自動作成
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}
