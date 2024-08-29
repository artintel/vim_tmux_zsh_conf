set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set nu
autocmd FileType python setlocal textwidth=120 formatoptions+=t
set wrap
set cuc
set backspace=start,eol,indent
set cul
set relativenumber
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set wildmenu
set hlsearch
set incsearch
set pastetoggle=<F9>
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"set clipboard=unnamed
set completeopt-=preview
let Tlish_Show_One_File=1
let Tlist_WinWidth=40
let Tlist_Exit_OnlyWindow=1
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:tagbar_left = 1
colorscheme molokai
" highlight CursorLine   cterm=underline ctermbg=black ctermfg=blue guibg=NONE guifg=NONE 
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorLine   cterm=underline ctermbg=NONE ctermfg=blue guibg=NONE guifg=NONE 
highlight CursorColumn cterm=NONE ctermbg=DarkYellow ctermfg=NONE guibg=NONE guifg=NONE
highlight Visual ctermbg=DarkBlue guibg=DarkBlue
set cuc
set cul
" set tags+=/<path>/tags;/<path2>/tags;
hi Normal ctermfg=252 ctermbg=none
"

"if configured airline, but terminal do not show colors.
"pls add env variable in ~/.bashrc or ~/.zshrc as follows
"`export TERM=xterm-256color`

" Nerdcommended  ----------------------------------------------------------------{{{
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" }}}

" LEADERF  ----------------------------------------------------------------{{{
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_ShortcutF = '<leader>f'
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowHeight = 0.15
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
" search word under cursor in *.h and *.c and *.cpp files.
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,hpp,cpp,c}",expand("<cword>"))<CR><CR>

" search word under cursor in cpp files, exclude the *.h files
noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{cpp,c}",expand("<cword>"))<CR><CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
nnoremap <silent> <leader>r :Leaderf rg --current-buffer<CR>
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
" }}}

" AIRLINE  ----------------------------------------------------------------{{{
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set laststatus=2
"let g:airline_theme='murmur'
let g:airline_theme='papercolor'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_alt_sep = '❯'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" }}}

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
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" highlight YcmErrorLine ctermbg=red ctermfg=white guibg=#FF0000 guifg=#FFFFFF
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar
" }}}

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/taglist.vim'
    Plug 'ycm-core/YouCompleteMe', { 'commit':'d2abd1594f228de79a05257fc5d4fca5c9a7ead3' }
    Plug 'rdnetto/YCM-Generator',
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdcommenter'
    "Plug 'ycm-core/YouCompleteMe'
    Plug 'wakatime/vim-wakatime'
    "https://wakatime.com/vim
    Plug 'preservim/tagbar'
    Plug 'chr4/nginx.vim'
call plug#end()
" }}}
"
" MAPPINGS ---------------------------------------------------------------{{{
" C means ctrl
	map <F2> :NERDTreeToggle<CR>
	inoremap jj <ESC>
	nnoremap <space> :
	map <F4> :Tlist<CR>
	nnoremap <F5> :!man <C-R>=expand("<cword>")<CR><CR>
	nnoremap <S-up> :resize -1<CR>
	nnoremap <S-down> :resize +1<CR>
	nnoremap <S-left> :vertical resize -1<CR>
	nnoremap <S-right> :vertical resize +1<CR>
    "map <C-b> <C-a>
    "inoremap ( ()<ESC>i
    "inoremap [ []<ESC>i
    "inoremap { {}<ESC>i
    "inoremap < <><ESC>i
    "inoremap " ""<ESC>i
    "innoremap <leader>v <C-q> 
    nnoremap o o<ESC>
    nnoremap O O<ESC>
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap <C-\> :YcmCompleter GoTo<CR>
    nnoremap [b :bp<CR>
    nnoremap ]b :bn<CR>
    nnoremap <C-k> :call ToggleTagbarWithNumbers()<CR>
    map <leader>1 :b 1<CR>
    map <leader>2 :b 2<CR>
    map <leader>3 :b 3<CR>
    map <leader>4 :b 4<CR>
    map <leader>5 :b 5<CR>
    map <leader>6 :b 6<CR>
    map <leader>7 :b 7<CR>
    map <leader>8 :b 8<CR>
    map <leader>9 :b 9<CR>
    nnoremap <silent> <leader>r :Leaderf rg --current-buffer<CR>
    " use for env without copilot
    "inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    "inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}
"
" VIMSCRIPT --------------------------------------------------------------{{{
" This will enable code folding
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
autocmd filetype nerdtree set number
autocmd filetype nerdtree set relativenumber
function! ToggleTagbarWithNumbers()
    TagbarToggle
        wincmd w
        set number
        set relativenumber
endfunction
autocmd FileType c,cpp setlocal formatoptions-=cro

autocmd BufNewFile,BufRead X:/yourdir* let g:Lf_WildIgnore={'file':['*.vcproj', '*.vcxproj'],'dir':[]}

" More Vimscripts code goes here.
" }}}
"
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

