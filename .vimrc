"-------------- set up plugins  --------------
silent !mkdir ~/.vim/colors
"
" Use :PlugInstall and :PlugClean to install and clean
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized', { 'do': 'cp colors/solarized.vim ~/.vim/colors/' }
Plug 'mihaifm/bufstop'
Plug 'itchyny/lightline.vim'

call plug#end()

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"-------------------------------------

set laststatus=2
set noshowmode
set smartindent
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth =2

set hlsearch
set incsearch

"if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not
set ignorecase
set smartcase

set number

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256


set runtimepath^=~/.vim/plugged/ctrlp.vim
"Ignores files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ------ preferred mappings ------

" faster indents
nnoremap > >>
nnoremap < <<

" 10 lines at a time
nnoremap ,j 10j
nnoremap ,k 10k

" preferred pane movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" jj to get into normal mode
imap jj <Esc>

" insert new line but stay in normal mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" swap: current character, current word with prev, current word with next
nnoremap <silent> gc xph
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
