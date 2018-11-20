set hlsearch " サーチ文字列をハイライトにする
set ruler " 最下行に常時、カーソル位置情報を出力する
set history=50 " historyを50個にする
set wildchar=<Tab>
set fileformats=unix
set mouse=a " マウスモード有効
set ttytype=dtterm
set ttymouse=xterm2
set nobackup

"-------------------------------------------------
" Indent インデント設定
"-------------------------------------------------
 
" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set softtabstop=4

"# Tabを半角スペースx個に変換
" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
set noexpandtab
"retab

" <Tab> が対応する空白の数。
set tabstop=4
    
" インデントの各段階に使われる空白の数
set shiftwidth=4

" tabの可視化
set list
set listchars=tab:^\ 

" Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
"set expandtab
        
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"set number "行番号表示
set backspace=2 " バックスペースでインデントや改行を削除できるようにする
set nowrapscan "検索時に先頭に戻らない
set title " タイトルをウインドウ枠に表示する
"set list " タブ文字を CTRL-I で表示し、行末に $ で表示する
set wildmenu " コマンドライン補完を拡張モードにする
set ic

"行をまたぐカーソル移動
set whichwrap=b,s,h,l,<,>,[,]

"「/」での検索で、入力しながらサーチする
set incsearch

""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

hi      Identifier ctermfg=2

if &term == "kterm"
        set t_kb=<BS>
        fix
endif
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction
function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction
"行番号
set number
set ruler
"カッコの設定
set showmatch
nnoremap <silent> <F1> :cd %:h<CR>
nnoremap <silent> <F2> :ls <CR>
nnoremap <silent> <F3> :e .<CR>
nnoremap <C-h> 1<C-g>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"ハイライトの設定
"""""""""""""""""""""""""""""
"カラースキーマ設定
syntax on
set t_Co=256
colorscheme molokai

"コメントアウトを緑に
"highlight Comment ctermfg=Green

augroup vimrc-syntax
	autocmd!
	autocmd Syntax * syntax keyword hakuginTypes INT8 UINT8 INT16 UINT16 INT32 UINT32 INT64 UINT64 VOID CHAR ADDRESS BOOL UNICODE containedin=ALL
	autocmd Syntax * syntax keyword hakuginIdentifier IMPORT PUBRIC PRIVATE containedin=ALL
augroup END
highlight link hakuginTypes Type
highlight link hakuginIdentifier Identifier

"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark
""""""""""""""""""""""""""""""

"----------------------------------------------------
" GNU GLOBAL(gtags)
"----------------------------------------------------
"検索結果ウィンドウを閉じる
nmap <C-q> <C-w><C-w><C-w>q	
"nmap <C-g> :Gtags -g					grep

"このファイルの関数一覧
nmap <C-l> :Gtags -f %<CR>

"カーソル以下の定義元を探す
"nmap <S-C-j> :vs<CR> :Gtags <C-r><C-w><CR>
nmap <C-j> :Gtags <C-r><C-w><CR>

"カーソル以下の使用箇所を探す
"nmap <S-C-k> :vs<CR> :Gtags -r <C-r><C-w><CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>

"次の検索結果にジャンプ
nmap <C-n> :cn<CR>
"前の検索結果にジャンプ
nmap <C-p> :cp<CR>)
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
"クリップボード操作
""""""""""""""""""""""""""""""
"vnoremap <S-Insert> :set nolist<CR><S-Insert>:set list<CR>
":set nopaste

""""""""""""""""""""""""""""""
"クリップボード操作
""""""""""""""""""""""""""""""
"vnoremap <S-Insert> :set nolist<CR><S-Insert>:set list<CR>
":set nopaste

""""""""""""""""""""""""""""""
"検索ヒット数表示
""""""""""""""""""""""""""""""
"nnoremap <expr> / _(":%s/<Cursor>/&/gn")
"
"function! s:move_cursor_pos_mapping(str, ...)
"	let left = get(a:, 1, "<Left>")
"	let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'l    eft'), "")
"	return substitute(a:str, '<Cursor>', '', '') . lefts
"	endfunction
"
"function! _(str)
"	return s:move_cursor_pos_mapping(a:str, "\<Left>")
"	endfunction

