set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'puppetlabs/puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'itchyny/lightline.vim'
Plugin 'wincent/command-t'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mv/mv-vim-puppet'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call vundle#end()

let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"------ Console UI & Text display ------"


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

" Always show a status line
set laststatus=2
"make the command line 1 line high
set cmdheight=1
set cmdheight=1                 " explicitly set the height of the command line
set showcmd                     " Show (partial) command in status line.
set number                      " yay line numbers
set numberwidth=4
set background=dark
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set title
set nobackup
set noswapfile
set ruler                       " show current position at bottom
set noerrorbells                " don't whine
set visualbell t_vb=            " and don't make faces
set lazyredraw                  " don't redraw while in macros
set scrolloff=5                 " keep at least 5 lines around the cursor
set nowrap                        " soft wrap long lines
set hidden
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace
set report=0                    " report back on all changes
set shortmess=atI               " shorten messages and don't show intro
set wildmenu                    " turn on wild menu :e <Tab>
set wildmode=list:longest       " set wildmenu to list choice
if has('syntax')
    syntax on
    " Remember that rxvt-unicode has 88 colors by default; enable this only if
    " you are using the 256-color patch
    if &term == 'rxvt-unicode'
        set t_Co=256
    endif

    if &t_Co == 256
        colorscheme solarized
    else
        colorscheme solarized
    endif
endif

if has('gui_running')
    set background=light
else
    set background=dark
endif

"------ Text editing and searching behavior ------"

set hlsearch                  " turn off highlighting for searched expressions
set incsearch                   " highlight as we search however
set matchtime=5                 " blink matching chars for .x seconds
set mouse=a                     " try to use a mouse in the console (wimp!)
set ignorecase                  " set case insensitivity
set smartcase                   " unless there's a capital letter
set completeopt=menu,longest,preview " more autocomplete <Ctrl>-P options
set nostartofline               " leave my cursor position alone!
set backspace=2                 " equiv to :set backspace=indent,eol,start
set textwidth=80                " we like 80 columns
set showmatch                   " show matching brackets
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

"------ Indents and tabs ------"

set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=2                " spaces for each step of (auto)indent
set softtabstop=2               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings
" OS X paste (pretty poor implementation)
if has('mac')
    noremap  √ :r!pbpaste<CR>
    noremap! √ <Esc>√
endif

"------ Filetypes ------"

" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Puppet
autocmd FileType pp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

"------ END VIM-500 ------"
set foldmethod=marker

if version >= 800
  set sp=en spell
  set nospell
endif

set more
set autoread
set noautowrite
set showmode
set ttyfast

set clipboard=unnamed

" save file (ctrl-s)
:map <C-s> :w<cr>
" " copy selected text (ctrl-c)
:vmap <C-c> y
" " Paste clipboard contents (ctrl-v)
:imap <C-p> <esc>P
" " cut selected text (ctrl-x)
:vmap <C-x> x

iab AlP ABCDEFGHIJKLMNOPQRSTUVWXYZ
iab MoN January February March April May June July August September October November December
iab MoO Jan Feb Mar Apr May Jun Jul Aug Sep Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
iab NuM 12345678901234567890123456789012345678901234567890123456789012345678901234567890·
iab RuL ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9----+----0

" Highlight every other line
map ,<Tab> :set hls<CR>/\\n.*\\n/<CR>

" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture whole line):
" Write
nmap ;w :. w! ~/.vimxfer<CR>
" Read
nmap ;r :r ~/.vimxfer<CR>
" Append·
nmap ;a :. w! >>~/.vimxfer<CR>

map <leader>f     :NERDTreeToggle<CR>
map <leader>t     :CommandT<CR>
map <leader>b     :BufExplorer<CR>
map <leader>o     :TlistToggle<CR>

