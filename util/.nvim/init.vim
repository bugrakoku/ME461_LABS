
"call plug#begin()
""Plug 'SirVer/ultisnips'
""Plug 'honza/vim-snippets'
""Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline' " airline provides the status line at the bottom
"Plug 'vim-airline/vim-airline-themes' " airline themes
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " dark powered neo-completion - 
"Plug 'zchee/deoplete-jedi'
""Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs' " inserts pairs automatically, speaks for itself
"Plug 'scrooloose/nerdcommenter'
""Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToogle'}
"Plug 'scrooloose/nerdtree' 
"" following is for markdown preview
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"" enable jupyter plugin 
""Plug 'jupyter-vim/jupyter-vim'
"" vim wiki plugin"
"Plug 'vimwiki/vimwiki'
""vim markdown tool
""Plug 'plasticboy/vim-markdown'
""Plug 'nvim-telescope/telescope.nvim'
""Plug 'ggandor/lightspeed.nvim'
"call plug#end()


"set airline theme
let g:airline_theme='base16_monokai'
"let g:airline_theme='angr'

"enable autocompletion at start up
"do not forget to install:
"pip install pynvim
"pip install jedi
let g:deoplete#enable_at_startup = 1

let g:vimwiki_list = [{'path': '~/git_bi_bak/notlar/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"to use tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"change leader to ; from \
let mapleader=";"
"map ı i

"edit this config file
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
"reload this config file
nnoremap <leader>sc :source $MYVIMRC<CR>

"let double leader work as escape in both insert and visual modes
imap ;; <Esc>
vmap ;; <Esc>
nmap <silent> <leader>; :noh<CR>
nmap <leader>w :w<CR>
"list buffers
nnoremap <silent> <leader>ls :ls<CR>
"toggle between current and last buffer
nnoremap <silent> <leader>bb <C-^>
"move to the next buffer
nnoremap <silent> <leader>bn :bn<CR> 
"move to the previous buffer
nnoremap <silent> <leader>bp :bp<CR>
"close buffer without loosing current window
nnoremap <silent> <leader>bd :lclose<bar>b#<bar>bd #<CR>
"clear seach higligh
nnoremap <silent> <leader>h :noh<CR>
"code folding
nnoremap <silent> <leader>F :foldopen<return>
nnoremap <silent> <leader>f :foldclose<return>
nnoremap <silent> <leader>fold :set foldmethod=indent<return>
"move to next tab
nnoremap <silent> <leader>t :tabn<CR>
"toggle markdown preview
nnoremap <silent> <leader>m lkarkdownPreview<CR>
"line numbers
nnoremap <silent> <leader>ln :set nu<CR>
nnoremap <silent> <leader>lnh :set nu!<CR>
nnoremap <silent> <leader>lnr :set rnu<CR>
nnoremap <silent> <leader>lnrh :set rnu!<CR>

" toogle nerdtree shortcut
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>


"run python files in normal mode
nmap <silent> <leader>r :!python3 %<CR>

"in terminal mode use ESC to get out of insert mode
:tnoremap <Esc> <C-\><C-n>

" paste last thing yanked, not deleted or cut or replaced etc
nmap ,p "0p
nmap ,P "0P

"set scroll up and down to usual suspect along with CTRL
nnoremap <silent> <S-k> <C-e>
nnoremap <silent> <S-j> <C-y>

" remap arrows only to be used in window navigation
nmap <up> <C-w><up>
nmap <down> <C-w><down>
nmap <left> <C-w><left>
nmap <right> <C-w><right>
nmap <C-k> <C-w><up>
nmap <C-j> <C-w><down>
nmap <C-h> <C-w><left>
nmap <C-l> <C-w><right>




filetype plugin on
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
"set nohlsearch
set tabstop=4
set shiftwidth=4
set mouse=a
"set splitbelow
"set splitright
"syntax on " Syntax highlighting
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
"set spell
set spelllang=en,tr
" line under current cursor
set cursorline " nocursorline to unset

" set scroll padding
set scrolloff=7
