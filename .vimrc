set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required
set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m

set scrolloff=5 " スクロール時の余白確保
set textwidth=0 " 一行に長い文章を書いていても自動折り返しをしない
set nobackup " バックアップ取らない
set autoread " 他で書き換えられたら自動で読み直す
set noswapfile " スワップファイル作らない
set hidden " 編集中でも他のファイルを開けるようにする
set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープをならさない
set browsedir=buffer " Exploreの初期ディレクトリ
set showcmd " コマンドをステータス行に表示
filetype plugin on " ファイルタイプごとのプラグイン

set showmatch " 括弧の対応をハイライト
set showcmd " 入力中のコマンドを表示
set number  " 行番号表示
set list  " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<" 不可視文字の表示形式
set display=uhex " 印字不可能文字を16進数で表示

" 全角スペースをハイライト
if has("syntax")
  syntax on
  function! ActivateInvisibleIndicator()
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Cyan guibg=Cyan
  endf
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" indent
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
augroup vimrc
autocmd! FileType perl setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" autocomplete and history
set wildmenu " コマンド補完を強化
set wildchar=<tab> " コマンド補完を開始するキー
set wildmode=list:full " リスト表示，最長マッチ
set history=1000  " コマンド・検索パターンの履歴数
set complete+=k		" 補完に辞書ファイル追加

" search
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]'")<CR><CR>
"選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" encoding
" 改行文字
set ffs=unix,dos,mac
" デフォルトエンコーディング
set encoding=utf-8

" key bindings
" 行単位で移動(1行が長い場合に便利)
nnoremap j gj
nnoremap k gk
" バッファ周り
nmap <silent> <C-l> :bnext<CR>
nmap <silent> <C-h> :bprevious<CR>
nmap <silent> ,l	:BufExplorer<CR>
" 検索などで飛んだらそこを真ん中に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz
"usキーボードで使いやすく
nmap ; :

" plugins
"-------------------------------------------------------------------------------
" rails.vim
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 expandtab"
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" filetype difinition
"-------------------------------------------------------------------------------
au BufRead,BufNewFile *.cgi	set filetype=perl

" bless
"-------------------------------------------------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap “” “”<Left>
imap ” ”<Left>
imap <> <><Left>
imap “ “<Left>


augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
