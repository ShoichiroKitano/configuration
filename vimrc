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
set backspace=indent,eol,start

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

function SetForGolangAndC()
  setlocal listchars=tab:\ \ ,trail:_,extends:>,precedes:<
  setlocal noexpandtab
endfunction

augroup vimrc
  autocmd! FileType go call SetForGolangAndC()
  autocmd! FileType c call SetForGolangAndC()
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

"BufferExploreでNo Nameバッファを表示する
let g:bufExplorerShowNoName=1

" カーソル以下の文字列をハイライト
nnoremap <silent> <C-k><C-w> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

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
" nnoremap <C-]> g<C-]>

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

" 色をmac vimに合わせる
set background=dark

" mouse操作を無効化
set mouse=

" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

let s:previousBuffer = 0
let s:searchedTagName = ''
let s:curpos = []

def s:JumpTag()
  var tagNumber = split(getline('.'))[0]
  exec printf(":buffer %d", s:originBuffer)
  cursor(slice(s:curpos, 1, len(s:curpos)))
  exec printf(":%stag %s", tagNumber, s:searchedTagName)
  s:curpos = []
  s:originBuffer = 0
  s:searchedTagName = ''
enddef

def TagExplorerExact()
  s:searchedTagName = expand('<cword>')
  var tags = taglist(printf("\\<%s\\>", s:searchedTagName))
  if empty(tags)
    return
  endif
  s:originBuffer = bufnr("%") + 0
  s:curpos = getpos('.')

  execute 'silent keepjumps hide edit ' .. '[TagExplorer]'
  setlocal nobuflisted
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  setlocal wrap
  setlocal nolist
  setlocal nonumber
  setlocal modifiable

  var i = 1
  for tag in tags
    var cmd = tag['cmd']
    if cmd[1] == '^'
      cmd = slice(cmd, 2)
    else
      cmd = slice(cmd, 1)
    endif
    if cmd[len(cmd) - 2] == '$'
      cmd = slice(cmd, 0, len(cmd) - 2)
    else
      cmd = slice(cmd, 0, -1)
    endif
    cmd = substitute(cmd, "\t", ' ', 'g')
    setline(i, printf(" %2d\t%s\t%s", i, cmd, tag['filename']))
    i += 1
  endfor

  silent exec ":%!column -s $'\t' -t"

  setlocal nomodifiable

  nnoremap <script> <silent> <nowait> <buffer> <CR> :call <SID>JumpTag()<CR>
enddef

command! TagExplorerExact :call TagExplorerExact()
nnoremap <silent> <C-]> :TagExplorerExact<CR>
