" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

filetype plugin on

call plug#begin('~/.config/nvim/plugged')
  Plug 'alaviss/nim.nvim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'flazz/vim-colorschemes'
" Plug 'ryanoasis/vim-devicons'
call plug#end()

set keymap=greek_utf-8
set iminsert=0 imsearch=-1
set nu
set foldlevelstart=20
set shiftwidth=2
set tabstop=2
set expandtab
set mouse=a
set clipboard+=unnamedplus
set guifont=*:h16

colorscheme PerfectDark

" integrate with global clipboard
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
xnoremap p "_dP

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Make classic paste work in insert and command mode
inoremap <C-V> <ESC>"*gPa
cnoremap <C-V> <C-R>*

" Make Enter work ffs
nnoremap <CR> :normal o<CR>

" Integrated terminal
set splitright
set splitbelow
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal nonumber norelativenumber
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <C-N> :call OpenTerminal()<CR>

let g:terminal_color_foreground = "#ecf0c1"
let g:terminal_color_background = "#0f111b"
let g:terminal_color_0 = "#000000"
let g:terminal_color_1 = "#e33400"
let g:terminal_color_2 = "#5ccc96"
let g:terminal_color_3 = "#b3a1e6"
let g:terminal_color_4 = "#00a3cc"
let g:terminal_color_5 = "#ce6f8f"
let g:terminal_color_6 = "#7a5ccc"
let g:terminal_color_7 = "#686f9a"
let g:terminal_color_8 = "#686f9a"
let g:terminal_color_9 = "#e33400"
let g:terminal_color_10 = "#5ccc96"
let g:terminal_color_11 = "#b3a1e6"
let g:terminal_color_12 = "#00a3cc"
let g:terminal_color_13 = "#ce6f8f"
let g:terminal_color_14 = "#7a5ccc"
let g:terminal_color_15 = "#ecf0c1"

" File explorer
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
highlight VertSplit guifg=gray
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p

" Nim LSP
let s:nimlspexecutable = "nimlsp"
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_popup = 0

if executable(s:nimlspexecutable)
  au User lsp_setup call lsp#register_server({
  \ 'name': 'nimlsp',
  \ 'cmd': {server_info->[s:nimlspexecutable]},
  \ 'whitelist': ['nim'],
  \ })
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Filetype tweaks
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
