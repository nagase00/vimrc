set hlsearch " ������ʸ�����ϥ��饤�Ȥˤ���
set ruler " �ǲ��Ԥ˾��������������־������Ϥ���
set history=50 " history��50�Ĥˤ���
set wildchar=<Tab>
set fileformats=unix
set mouse=a " �ޥ����⡼��ͭ��
set ttytype=dtterm
set ttymouse=xterm2
set nobackup

"-------------------------------------------------
" Indent ����ǥ������
"-------------------------------------------------
 
" �������Ԥ򳫻Ϥ����Ȥ��ˡ��������ԤΥ���ǥ�Ȥ򸽺߹Ԥ�Ʊ���̤ˤ���
set autoindent

" �������Ԥ��ä��Ȥ��˹��٤ʼ�ư����ǥ�Ȥ�Ԥ�
set smartindent

" <Tab> �������� <BS> �λ��������Խ����򤹤�Ȥ��ˡ�<Tab> ���б��������ο���
set softtabstop=4

"# Tab��Ⱦ�ѥ��ڡ���x�Ĥ��Ѵ�
" Insert�⡼�ɤ� <Tab> ����������Ȥ��������Ŭ�ڤʿ��ζ����Ȥ�����ͭ��:expandtab/̵��:noexpandtab��
set noexpandtab
"retab

" <Tab> ���б��������ο���
set tabstop=4
    
" ����ǥ�Ȥγ��ʳ��˻Ȥ������ο�
set shiftwidth=4

" tab�βĻ벽
set list
set listchars=tab:^\ 

" Insert�⡼�ɤ� <Tab> ����������Τˡ�Ŭ�ڤʿ��ζ����Ȥ�
"set expandtab
        
" ��Ƭ��;����� Tab ���Ǥ�����ȡ�'shiftwidth' �ο���������ǥ�Ȥ���
set smarttab

"set number "���ֹ�ɽ��
set backspace=2 " �Хå����ڡ����ǥ���ǥ�Ȥ���Ԥ����Ǥ���褦�ˤ���
set nowrapscan "����������Ƭ�����ʤ�
set title " �����ȥ�򥦥���ɥ��Ȥ�ɽ������
"set list " ����ʸ���� CTRL-I ��ɽ������������ $ ��ɽ������
set wildmenu " ���ޥ�ɥ饤���䴰���ĥ�⡼�ɤˤ���
set ic

"�Ԥ�ޤ������������ư
set whichwrap=b,s,h,l,<,>,[,]

"��/�פǤθ����ǡ����Ϥ��ʤ��饵��������
set incsearch

""""""""""""""""""""
" ���ѥ��ڡ�����ɽ��
""""""""""""""""""""
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /��/

hi      Identifier ctermfg=2

if &term == "kterm"
        set t_kb=<BS>
        fix
endif
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""
"�����⡼�ɻ������ơ������饤��ο����ѹ�
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
"���ֹ�
set number
set ruler
"���å�������
set showmatch
nnoremap <silent> <F1> :cd %:h<CR>
nnoremap <silent> <F2> :ls <CR>
nnoremap <silent> <F3> :e .<CR>
nnoremap <C-h> 1<C-g>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" ��ưŪ���Ĥ���̤�����
""""""""""""""""""""""""""""""
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"�ϥ��饤�Ȥ�����
"""""""""""""""""""""""""""""
"���顼������������
syntax on
set t_Co=256
colorscheme molokai

"�����ȥ����Ȥ��Ф�
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
"������̥�����ɥ����Ĥ���
nmap <C-q> <C-w><C-w><C-w>q	
"nmap <C-g> :Gtags -g					grep

"���Υե�����δؿ�����
nmap <C-l> :Gtags -f %<CR>

"��������ʲ����������õ��
"nmap <S-C-j> :vs<CR> :Gtags <C-r><C-w><CR>
nmap <C-j> :Gtags <C-r><C-w><CR>

"��������ʲ��λ��Ѳս��õ��
"nmap <S-C-k> :vs<CR> :Gtags -r <C-r><C-w><CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>

"���θ�����̤˥�����
nmap <C-n> :cn<CR>
"���θ�����̤˥�����
nmap <C-p> :cp<CR>)
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
"����åץܡ������
""""""""""""""""""""""""""""""
"vnoremap <S-Insert> :set nolist<CR><S-Insert>:set list<CR>
":set nopaste

""""""""""""""""""""""""""""""
"����åץܡ������
""""""""""""""""""""""""""""""
"vnoremap <S-Insert> :set nolist<CR><S-Insert>:set list<CR>
":set nopaste

""""""""""""""""""""""""""""""
"�����ҥåȿ�ɽ��
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

