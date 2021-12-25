" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

call plug#begin('~/.config/nvim/plugged')
  Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'alaviss/nim.nvim'
  Plug 'flazz/vim-colorschemes'
  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" === General ===
filetype plugin on

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

highlight VertSplit guifg=gray
colorscheme PerfectDark

" === Integrate with global clipboard ===
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
xnoremap p "_dP

" === Move lines up/down ===
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" === Change window focus ===
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-l> :wincmd l<CR>
tnoremap <silent> <A-h> <C-\><C-n>:wincmd h<CR>
tnoremap <silent> <A-j> <C-\><C-n>:wincmd j<CR>
tnoremap <silent> <A-k> <C-\><C-n>:wincmd k<CR>
tnoremap <silent> <A-l> <C-\><C-n>:wincmd l<CR>

" === Make classic paste work in insert and command mode ===
inoremap <A-v> <ESC>"+gpi
tnoremap <A-v> <C-\><C-n>pi
cnoremap <A-v> <C-r>+

" === Make Enter work ffs ===
nnoremap <CR> :normal o<CR>

" === Clear search ===
nnoremap <Esc> :noh<CR>

" === Fuzzy Finder ===
nnoremap <C-p> :FZF<CR>

" === Integrated terminal ===
set splitright
set splitbelow

function! OpenTerminal()
  let size = &lines / 4
  split term://zsh
  exec "resize " . size
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" Close terminal
tnoremap <Esc> <C-\><C-n>:q<CR>

function! ToggleFullscreen()
  let size = &lines / 4
  if winheight(0) == size
    resize
  else
    exec "resize " . size
  endif
endfunction
tnoremap <C-n> <C-\><C-n>:call ToggleFullscreen()<CR>i

" Jump to and from terminal
"nnoremap <C-CR> <C-w><C-p>
"vnoremap <C-CR> <C-w><C-p>
"inoremap <C-CR> <Esc><C-w><C-p>
"tnoremap <C-CR> <C-\><C-n><C-w><C-p>
tnoremap <C-p> <C-\><C-n>:FZF<CR>

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

" === COC ===
" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)
" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

" === Auto commands ===
autocmd BufRead,BufNewFile *.sbt,*.sc set filetype=scala
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd BufWinEnter * if &buftype == 'terminal' | silent! normal i | endif
autocmd WinEnter * if &buftype == 'terminal' | silent! normal i | endif
