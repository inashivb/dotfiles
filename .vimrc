set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'rust-lang/rust.vim'
Plugin 'rust-analyzer/rust-analyzer'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Zenburn'
Plugin 'pseewald/anyfold'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

if &t_Co >= 256 || has("gui_running")
    colorscheme zenburn
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

filetype plugin indent on

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set expandtab     "use spaces instead of tabs"
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=10000         " remember more commands and search history
set undolevels=10000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set cursorline
set cursorcolumn
set laststatus=2
set directory=$HOME/.vim/swp//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undodir//
set tags+=$HOME/.vim/ctags//

filetype plugin indent on

autocmd filetype python set expandtab

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>
nnoremap ; :
nnoremap n nzz
nnoremap N Nzz

vnoremap . :normal.<CR>

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=manual "Defines the type of folding.

fu! EnableJsonFoldSyntax()
    set filetype=json
    set syntax=on
    set foldmethod=syntax
endf

command! Jfs call EnableJsonFoldSyntax()

set tags+=$HOME/.vim/tags

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 10

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
