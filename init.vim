" Using Plug.vim for plugin management
call plug#begin('~/AppData/nvim/plugged')
  Plug 'kien/ctrlp.vim'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'iCyMind/NeoSolarized'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'yggdroot/indentline'
  Plug 'vim-scripts/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'rican7/php-doc-modded'
  Plug 'ap/vim-buftabline'
  Plug 'honza/vim-snippets'
  Plug 'justinmk/vim-sneak'
  Plug 'jwalton512/vim-blade'
call plug#end()

" When on, Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window.
set autochdir

" allow backspacing over autoindent, allow backspacing over line breaks (join lines)
"	allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.
set backspace=2

" File encoding to UTF-8
set fileencoding=utf-8
set encoding=utf-8

"set pastetoggle=<F2>

" When unnamed, Vim will use the clipboard register '*' for all yank, delete,
" change and put operations which would normally go to the unnamed register.
set clipboard=unnamed

" Leader key
let mapleader=","

" Save commands in normal, visual and insert mode
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Quit command in normal mode
noremap <Leader>q :quit<CR> " Current window

set hidden

" Buffer navigation and close
map <Leader>m :bn<CR>
map <Leader>n :bp<CR>
map <Leader>c :bd<CR>

" Indenting in visual mode
vnoremap > <gv
vnoremap < >gv

" Up and down line swapping in normal, insert and visual mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Disabling arrows because it's bad in normal, visual with an exception of up
" and down in insert for auto completion
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
no <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
vno <down> <Nop>

" Not sure what this is
filetype off
filetype plugin indent on

" Disabling search higlight
map <Leader>h :nohl<CR>

" Enabling syntax highlighting
syntax enable

" Enabling auto indenting
set autoindent
set smartindent

" Showing the line numbers column
set number

" Not wraping the text when window is small
set nowrap

" Formatting options but couldn't find what t is, removing it
set fo-=t

" Line break character, but not working with Cascadia right now...
set showbreak=↪

" Showing cursor line for better visual
set cursorline

" Setting tabs to 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Indenting to multiple of shiftwidth
set shiftround

" In insert mode putting the appropriate number of spaces
set expandtab

" Highlighting search terms
set hlsearch

" Highlighting terms as you type the search
set incsearch

" Ignoring case when searching
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper
" case characters.  Only used when the search pattern is typed and
" 'ignorecase' option is on.
set smartcase

" Disable mode showing in last line as using airline instead.
set noshowmode

" Removing backup files
set nobackup
set nowritebackup
set noswapfile

" Setting default diff showing as vertical
set diffopt+=vertical


" Enables 24-bit RGB color in the |TUI|.
" Requires an ISO-8613-3 compatible terminal.
set termguicolors

" Setting light colorscheme
colorscheme NeoSolarized
set background=light

" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1

" CtrlP config
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_extensions = ['bookmarkdir']
let g:ctrlp_custom_ignore = '\v[\/](attachments|vendor|node_modules|bower_components|font-awesome)$'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<c-f>'] }

" Coc config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
let g:coc_snippet_next = '<tab>'

" Php Doc mapping
nnoremap <C-C> :call PhpDocSingle()<CR>

" BufTabLine config
let g:buftabline_indicators = 1

" Sneak config
let g:sneak#label = 1
