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
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Zenburn'
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
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

filetype plugin indent on

autocmd filetype python set expandtab

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>
nnoremap ; :
