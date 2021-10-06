" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

filetype plugin on

call plug#begin('~/.config/nvim/plugged')
  Plug 'alaviss/nim.nvim'
  Plug 'meatballs/vim-xonsh'
	Plug 'udalov/kotlin-vim'
call plug#end()

set keymap=greek_utf-8
set iminsert=0 imsearch=-1

set nu
set shiftwidth=2
set tabstop=2
"set expandtab

set clipboard+=unnamedplus
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
xnoremap p "_dP

autocmd Filetype promela setlocal expandtab tabstop=3 shiftwidth=3
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

set foldlevelstart=20
