" vim tips:
" :so ~/.vimrc ; :source
" ctrl-z ; jobs ; fg %job
" https://statico.github.io/vim.html
" https://statico.github.io/vim2.html
" https://statico.github.io/vim3.html
" ===================================

" turn off compatibility mode with vi
set nocompatible
" force vim to use 256 colors
set t_Co=256
set fileencoding=utf-8

" turn filetype detection off and, even if it's not strictly necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Use :PlugInstall in vim
call plug#begin('~/.vim/plugged')

  Plug 'junegunn/fzf'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter', { 'on': 'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
  Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'


"   if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
"   endif
"   let g:deoplete#enable_at_startup = 1


  " Run following:
  " sudo apt install ack-grep
  " sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
  " sudo apt install silversearcher-ag
  Plug 'mileszs/ack.vim' 
  " Use ag instead of ack, if ag exists
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

call plug#end()

" turn filetype detection, indent scripts and filetype plugins on and syntax highlighting too
filetype plugin indent on
syntax on
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" use colorscheme from intellij (https://github.com/blueshirts/darcula)
colorscheme darcula
hi Normal guibg=NONE ctermbg=NONE

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE

" display line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" change gutter column width
set numberwidth=3
" use the number column for the text of wrapped lines
set cpoptions+=n

" no of spaces for tab
set tabstop=2
" no of spaces for indentation
set shiftwidth=2
" insert spaces for tab button
set expandtab
set smarttab

" use the clipboard as the default register (in linux)
" check first: vim --version | grep clipboard => result should be: +clipboard or +xterm_clipboard
" also install packages vim-gtk or vim-gnome or vim-X11
set clipboard=unnamedplus

" keep the cursor vertically centered
" set scrolloff=999
" keep at least 4 lines at the bottom and top
set scrolloff=4

" show the next match while entering a search
set incsearch
" ignore case for search
set ignorecase
" if a search pattern contains an upper case letter, it will be case sensitive
set smartcase
" highlight search matches
set hlsearch
" use space as the map leader
let mapleader = "\<space>"

" KEY MAPS:
" :map - normal, visual, select and operator pending modes
" :map! - insert and command-line mode
" :nmap - Display normal mode maps
" :imap - Display insert mode maps
" :vmap - Display visual and select mode maps
" :smap - Display select mode maps
" :xmap - Display visual mode maps
" :cmap - Display command-line mode maps
" :omap - Display operator pending mode maps

" Press F3 to insert date
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" fix navigation for word-wrapped multiline text
nmap j gj
vmap j gj
nmap k gk
vmap k gk
nmap 0 g0
vmap 0 g0
nmap $ g$
vmap $ g$
nmap ^ g^
vmap ^ g^

" mappings to keep findings centered
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" cycle buffers
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>

" cycle tabs
nmap <leader><Right> :bnext<CR>
nmap <leader><Left> :bprev<CR>

" cycle splits
nmap <leader><Up> <C-w>W
nmap <leader><Down> <C-w>w

" Plugin mappings:
nmap <leader>f :Ack! 
nmap <leader>1 :NERDTreeToggle<CR>
" nmap ; :CtrlPBuffer<CR>


