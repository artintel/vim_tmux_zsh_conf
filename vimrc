set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set nu
autocmd FileType python setlocal textwidth=120 formatoptions+=t
set wrap
set cuc
set cul
set relativenumber
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set wildmenu
set pastetoggle=<F9>
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set completeopt-=preview
let Tlish_Show_One_File=1
let Tlist_WinWidth=40
let Tlist_Exit_OnlyWindow=1
" if use tags
" let tags+=xxxxxx/tags,xxxx/tags
colorscheme molokai
" highlight CursorLine   cterm=underline ctermbg=black ctermfg=blue guibg=NONE guifg=NONE 
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorLine   cterm=underline ctermbg=NONE ctermfg=blue guibg=NONE guifg=NONE 
highlight CursorColumn cterm=NONE ctermbg=DarkYellow ctermfg=NONE guibg=NONE guifg=NONE
"hi Normal ctermfg=252 ctermbg=none
"
" YCM  ----------------------------------------------------------------{{{
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_server_python_interptreter='/usr/lib/python3.8'
" Syntastic
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path=exepath("clangd")
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar
" }}}

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/taglist.vim'
    Plug 'ycm-core/YouCompleteMe', { 'commit':'d2abd1594f228de79a05257fc5d4fca5c9a7ead3' }
call plug#end()
" }}}
" MAPPINGS ---------------------------------------------------------------
" {{{
" C means ctrl
	map <F2> :NERDTreeToggle<CR>
	inoremap jj <ESC>
	nnoremap <space> :
	map <F4> :Tlist<CR>
	nnoremap <F5> :!man <C-R>=expand("<cword>")<CR><CR>
	nnoremap <S-j> :resize -1<CR>
	nnoremap <S-k> :resize +1<CR>
	nnoremap <S-h> :vertical resize -1<CR>
	nnoremap <S-l> :vertical resize +1<CR>
    map <C-b> <C-a>
    inoremap ( ()<ESC>i
    inoremap [ []<ESC>i
    inoremap { {}<ESC>i
    inoremap < <><ESC>i
    inoremap " ""<ESC>i
    nnoremap vv <C-v>    
    nnoremap o o<ESC>
    nnoremap O O<ESC>
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap <C-]> :YcmCompleter GoTo<CR>
" }}}
" VIMSCRIPT --------------------------------------------------------------
" {{{
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" More Vimscripts code goes here.
" }}}
" STATUS LINE    ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=
"
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
"
" Use a divider to separate the left side from the right side.
set statusline+=%=
"
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
"
" Show the status on the second to last line.
set laststatus=2
" }}}

