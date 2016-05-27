set t_Co=256
syntax on
set encoding=utf-8

"Install Vundel with git
""git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
""Than run ':BundleInstall'in vim after restart of vim
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle"
"Plugin 'gmarik/Vundle.vim'
"
""python"
Plugin 'vim-scripts/Pydiction'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline' 
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required


"Pydiction"
let g:pydiction_location = '/home/michaemichaell/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 3
"
""syntasitic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height=5
let g:syntastic_aggregate_errors = 1

 "automatically reload vimrc when it's saved
  au BufWritePost .vimrc so ~/.vimrc


  " configure Vim to auto-complete programming language syntaxe
 let g:syntastic_python_python_exec = '/path/to/python3'


  "ctrlP"
  let g:ctrlp_masetp = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " ignorecase



  "pep und flakes"
  let g:pyflakes_use_quickfix = 0

"
  "auto-complete-python"
   au FileType python set omnifunc=pythoncomplete#Complete
   let g:SuperTabDefaultCompletionType = "context"
   set completeopt=menuone,longest,preview

   "Disable arrow-keys"
   noremap <Up> <NOP>
   noremap <Down> <NOP>
   noremap <Left> <NOP>
   noremap <Right> <NOP>

   "powerline"
 " set noshowmode
 " set laststatus=2
 " let g:Powerline_symbols = 'fancy' " show fancy symbols (requires patched font)
 " set encoding=utf-8

   "Vim AIRLINE"
    let g:airline#extensions#tabline#enabled = 1
    let g:Powerline_symbols = "fancy"
    

   "Disable arrow-keys in insert mode"
   imap <up> <nop>
   imap <down> <nop>
   imap <left> <nop>
   imap <right> <nop>


   " Leader Key" 
   let mapleader=","

   "folding settings
   set foldmethod=indent "fold based on indent
   set foldnestmax=10      "deepest fold is 10 levels
   set nofoldenable        "dont fold by default
   set foldlevel=1         "this is just what i use

   "vimrc standart"
   colorscheme DevC++
   set incsearch
   set number
   set linebreak
   set visualbell
   set showmatch
   set hlsearch
   set smartcase
   set autoindent
   set smarttab
   set smartindent
   set colorcolumn=80
   highlight ColorColumn ctermbg=black
   set background=dark
   set tabstop=8
   set expandtab
   set shiftwidth=4
   set tabstop=8
   set expandtab
   set shiftwidth=4
   set softtabstop=4
   set modeline 
   set ruler
   set rnu
   set undolevels=1000
