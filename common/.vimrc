" vim tips:
" :so ~/.vimrc ; :source
" ctrl-z ; jobs ; fg %job
" https://statico.github.io/vim.html
" https://statico.github.io/vim2.html
" https://statico.github.io/vim3.html
" ===================================

" turn off compatibility mode with vi
" set nocompatible
" force vim to use 256 colors
" set t_Co=256
" set fileencoding=utf-8
" set encoding=utf-8


" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Use :PlugInstall in vim
call plug#begin('~/.vim/plugged')

  " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
  Plug 'airblade/vim-gitgutter'
  " ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) 
  Plug 'dense-analysis/ale'
  " Vim plug for switching between companion source files (e.g. .h and .cpp)
  Plug 'derekwyatt/vim-fswitch'
  " Vim plugin for pulling in C++ function prototypes into implementation files
  Plug 'derekwyatt/vim-protodef'
  " A Vim color scheme reproduction of the official JetBrains IDE Darcula theme
  Plug 'doums/darcula'
  " Vim script for text filtering and alignment
  Plug 'godlygeek/tabular'
  " Vim plugin, insert or delete brackets, parens, quotes in pair
  Plug 'jiangmiao/auto-pairs'
  " A command-line fuzzy finder
  Plug 'junegunn/fzf'
  " Distraction-free writing in Vim
  Plug 'junegunn/goyo.vim'
  " Hyperfocus-writing in Vim
  Plug 'junegunn/limelight.vim'
  " Material color scheme for Vim based on w0ng/vim-hybrid color scheme
  Plug 'kristijanhusak/vim-hybrid-material'
  " Plugin to move lines and selections up and down
  Plug 'matze/vim-move'
  " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
  Plug 'plasticboy/vim-markdown'
  " A tree explorer plugin for vim
  Plug 'preservim/nerdtree'
  " Vim plugin for intensely nerdy commenting powers
  Plug 'preservim/nerdcommenter'
  " Vim plugin that displays tags in a window, ordered by scope
  Plug 'preservim/tagbar'
  " Highlight the exact differences, based on characters and words
  Plug 'rickhowe/diffchar.vim'
  " A collection of language packs for Vim
  Plug 'sheerun/vim-polyglot'
  " A premier Vim plugin for Git
  Plug 'tpope/vim-fugitive'
  " All about 'surroundings': parentheses, brackets, quotes, XML tags, and more
  Plug 'tpope/vim-surround'
  " Lean & mean status/tabline for vim
  Plug 'vim-airline/vim-airline'
  " A plugin of NERDTree showing git status
  Plug 'Xuyuanp/nerdtree-git-plugin'
 
call plug#end()

" turn filetype detection off and, even if it's not strictly necessary, disable loading of indent scripts and filetype plugins
" filetype off
" turn filetype detection, indent scripts and filetype plugins on and syntax highlighting too
filetype plugin indent on
syntax on
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.ex set filetype=elixir
au BufNewFile,BufFilePre,BufRead *.exs set filetype=elixir

" dark or light
set background=dark
" colorscheme darcula
colorscheme hybrid_material
hi Normal guibg=NONE ctermbg=NONE

" turn off compatibility mode with vi
set nocompatible
" force vim to use 256 colors
set t_Co=256
set fileencoding=utf-8
set encoding=utf-8
" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
" display line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" change gutter column width
set numberwidth=4
" don't wrap lines
"set wrap!
set linebreak
" use the number column for the text of wrapped lines
set cpoptions+=n
set autoindent
" no of spaces for tab
set tabstop=2
set softtabstop=2
" no of spaces for indentation
set shiftwidth=2
" insert spaces for tab button
set expandtab
set smarttab
" hides buffer instead of closing it
set hidden
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
" Give more space for displaying messages.
set cmdheight=2
" Set terminal size
set termwinsize=12x0
" Always split below
set splitbelow
" Enable mouse drag on window splits
set mouse=a
" use space as the map leader
let mapleader = "\<space>"


" Plug 'preservim/nerdtree'
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = "left"     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns


" Plug 'preservim/tagbar'
" Focus the panel when opening it
let g:tagbar_autofocus = 1
" Highlight the active tag
let g:tagbar_autoshowtag = 1
" Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'
" Mapping to open and close the panel
nmap <F8> :TagbarToggle<CR>


" Plug 'derekwyatt/vim-fswitch'
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
nmap <leader>z :vsplit <bar> :wincmd l <bar> :FSRight<CR>

" Plug 'derekwyatt/vim-protodef'
" Pull in prototypes
nmap <buffer> <silent> <leader> ,PP
" Pull in prototypes without namespace definition"
nmap <buffer> <silent> <leader> ,PN


" Plug ''
let g:alchemist#elixir_erlang_src = "/home/marm/repos/ex"


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

" fix navigation for word-wrapped multiline text
"nmap j gj
"vmap j gj
"nmap k gk
"vmap k gk
"nmap 0 g0
"vmap 0 g0
"nmap $ g$
"vmap $ g$
"nmap ^ g^
"vmap ^ g^

" keep findings centered
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" move lines
nnoremap <Esc>[j :m .+1<CR>
nnoremap <Esc>[k :m .-2<CR>
inoremap <C-j> <Esc>:m .+1<CR>
inoremap <C-k> <Esc>:m .-2<CR>
vnoremap <C-j> :m '>+1<CR>
vnoremap <C-k> :m '<-2<CR>

" press F3 to insert date
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" cycle buffers
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>

" cycle tabs
nmap <leader><Right> :bnext<CR>
nmap <leader><Left> :bprev<CR>

" cycle splits
nmap <leader><Up> <C-w>W
nmap <leader><Down> <C-w>w

" plugin mappings:
nmap <leader>f :Ack! 
nmap <leader>1 :NERDTreeToggle<CR>
" nmap ; :CtrlPBuffer<CR>

" plasticboy/vim-markdown
autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR
let g:vim_markdown_frontmatter=1

" iamcco/markdown-preview.nvim
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.local/lib/github-markdown-css/github-markdown.css'

""" START: fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

""" END: fzf
