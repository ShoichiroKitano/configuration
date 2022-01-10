set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
set textwidth=0 " 一行に長い文章を書いていても自動折り返しをしない
set nobackup " バックアップ取らない
set noswapfile " スワップファイル作らない
set autoread " 他で書き換えられたら自動で読み直す
set hidden " 編集中でも他のファイルを開けるようにする
set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープをならさない
set browsedir=buffer " Exploreの初期ディレクトリ
set showcmd " コマンドをステータス行に表示
set showmatch " 括弧の対応をハイライト
set showcmd " 入力中のコマンドを表示
set number  " 行番号表示
set list  " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
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

" インデントの設定
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

function SetForGolang()
  setlocal listchars=tab:\ \ ,trail:_,extends:>,precedes:<
  setlocal noexpandtab
endfunction

augroup vimrc
  autocmd! FileType go call SetForGolang()
  autocmd! FileType perl setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

set wildmenu " コマンド補完時に現在の候補をハイライト
set wildchar=<tab> " コマンド補完を開始するキーをtabキーに割り当て(デフォルトでtabキーに割り当てられてる)
set history=1000  " コマンド・検索パターンの履歴数

" 検索の設定
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

" エンコーディング
" 改行文字
set ffs=unix,dos,mac
" デフォルトエンコーディング
set encoding=utf-8

"BufferExploreをキーバインドに割り当て
nmap <silent> <C-k><C-l> :BufExplorer<CR>

" カーソル以下の文字列をハイライト
nmap <C-k><C-w> #*
" nmap <C-k><C-w> :exe "/".expand('<cword>')<CR>

" 改行コードの自動認識
set fileformats=unix,dos,mac

" 全角の記号が半角幅にならないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" 拡張子の設定
au BufRead,BufNewFile *.t set filetype=perl " perlのテストファイル
au BufRead,BufNewFile *.tx set filetype=html " perlのテンプレートエンジン

"行末にあるスペースを赤字でハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"ctagsでデフォルトでジャンプできる候補を表示
nnoremap <C-]> g<C-]>

"アルファベットをインクリメント
set nf=alpha

" :Eのバグ修正
command E Ex

" matchit.vimを有効(rubyのdo endを%でジャンプ)
source $VIMRUNTIME/macros/matchit.vim

command -nargs=+ GitGrep call GitGrep(<f-args>)
function GitGrep(...)
  if a:0 == 1
    execute("vim " . a:1 . " `git ls-files .`" . " | cw")
  else
    execute("vim " . a:1 . " `git ls-files " . a:2 . "`" . " | cw")
  end
endfunction!

command -nargs=0 Ref call Ref()
function Ref()
  echo "ctrl + E 余白付きでスクロール"
  echo "\"* yankする際にクリップボードにコピー"
  echo ":reg レジスタの状態を出力"
  echo ":!command コマンド実行"
  echo ":!command % カレントバッファのファイルでコマンド実行"
  echo ":r !command コマンド実行してカレント行の直下に書き込み"
  echo ":w !command コマンド実行して結果をコマンドラインのバッファに出力"
  echo ":'<,'> !command 指定した範囲を標準入力としてコマンドを実行して指定した範囲に書き込み(filter)"
  echo "ctrl + r レジスタ番号 挿入モードとExモードでレジスタの内容をペースト. :!と組み合わせるとカレント行を実行できる"
  echo "ctrl + a インクリメント"
  echo "ctrl + x デクリメント"
  echo "矩形選択で g ctrl + a 各行でインクリメント"
  echo "矩形選択で g ctrl + x 各行でデクリメント"
  echo ":enew No Nameバッファを作成"
  echo ":new Windowを分割してNo Nameバッファを作成"
endfunction
