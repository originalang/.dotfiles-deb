"""" Vundle installation and setup

let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')

if !filereadable(vundle_readme) && confirm("Clone and Install Vundle?", "Y\nn") == 1
	exec '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
endif

set nocompatible
filetype off

" set runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle [ required ]
Plugin 'VundleVim/Vundle.vim'

"""" PLUGINS
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'junegunn/goyo.vim'

" All plugins must be added before this line
call vundle#end()
filetype plugin indent on	" required

""""""""""""""""""""""""""""""""""""

let python_highlight_all=1
filetype plugin on
syntax on

" Paper color scheme setup
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   },
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     }
  \	  }
  \ }

set t_Co=256
set background=dark
colorscheme PaperColor

" airline setup
set laststatus=2
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline_section_b='%{strftime("%c")}'

" tabline setup
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#left_sep=''

" NERDTree setup
map <silent> <C-n> :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Goyo setup
map <silent> <C-z> :Goyo<cr>

" line numbers
set nu
set relativenumber

se tabstop=4	" set tab size


" disable arrow key navigation
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

inoremap jj <Esc>
