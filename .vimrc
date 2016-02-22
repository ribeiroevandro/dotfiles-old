set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/tComment'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'

call vundle#end()            " required
filetype plugin indent on    " required
" Basics {{{
	syntax on
	set number
	" autocmd VimEnter * NERDTree
	set omnifunc=phpcomplete#CompletePHP
	set noswapfile
" }}}

" General {{{
	set mouse=a " use mouse everywhere
	set wildmenu " turn on command line completion wild style
" }}}


" Vim UI {{{
	colorscheme molokai
	set background=dark
	set showcmd " show the command being typed
	set cursorline " visually mark current line
	set textwidth=80
	set colorcolumn=+1
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" }}}

" Text Formatting/Layout {{{
	set shiftwidth=2 " auto-indent amount when using >> <<
	set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
	set tabstop=2 " real tabs should be 2, and they will show with set list on
	set autoindent
	match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers"
" }}}

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
"
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" Mappings {{{
	map <leader>c <c-/><c-/>

	nnoremap <c-s> :w<CR> 
	inoremap <c-s> <Esc>:w<CR>l
	vnoremap <c-s> <Esc>:w<CR> 
" }}}

" Airline {{{
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}

" CtrlP {{{
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_working_path_mode = 'ra'
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip
	let g:ctrlp_user_command = 'find %s -type f'
	let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }}}

" Syntastic {{{
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
" }}}
