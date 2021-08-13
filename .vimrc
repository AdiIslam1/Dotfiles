set encoding=utf-8
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rafi/awesome-vim-colorschemes'
call vundle#end()
if v:progname =~? "evim"
  finish
endif


if has('syntax') && has('eval')
  packadd! matchit
endif
filetype plugin indent on
syntax enable
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skel.cpp
autocmd BufWinEnter *.cpp call cursor(8,5)
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
packadd! dracula 
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:gruvbox_contrast_dark = 'hard'
colorscheme ayu
autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
autocmd vimEnter *.cpp map <F2> :w <CR> :!clear ; g++ -std=c++17 -O2 -Wall % -o %< &&  ./%< <cr>
autocmd filetype cpp nnoremap <F5> :w <bar> !g++-4.8 -ulimit -Wall -Wno-unused-result -std=c++17   -O2   % -o %:r && ./%:r <CR>
set laststatus=2
set noshowmode
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
set number
set relativenumber
au CursorHoldI * stopinsert
au InsertEnter * silent! let updaterestore=&updatetime | set updatetime=15000 | execute "!setxkbmap -option caps:swapescape" | redraw!
au InsertLeave * silent! let &updatetime=updaterestore | execute "!setxkbmap -option" | redraw!
