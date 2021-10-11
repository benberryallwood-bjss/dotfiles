" Plugins
call plug#begin("~/.vim/plugged")
  " Colourscheme
  Plug 'shaunsingh/nord.nvim'

  " NERDTree
  Plug 'preservim/nerdtree'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  " Plug 'tpope/vim-capslock'
  Plug 'easymotion/vim-easymotion'
  Plug 'alvan/vim-closetag'

  " Code completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Icons (load last)
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" How to do 90% of what plugins do (with just vim)
"
" Search through subdirectories with :find
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when tab complete
set wildmenu

" :b lets you autocomplete any open buffer

" Create the 'tags' file 
command! MakeTags !ctags -R .
" Use ^] to jump to tag under cursor
" Use g^] to list options for ambiguous tag
" Use ^t to jump back up the tag stack

" Read empty HTML template and move cursor to title
nnoremap ,html :-1read $XDG_CONFIG_HOME/nvim/.html-template.html<CR>6jf>a

" Abbreviations for insert mode
" JavaScript
iabbr clg console.log()<ESC>

" Copy contents of current file to clipboard
command! CopyFile !cat %:p | pbcopy

" Default 4000ms, for gitgutter responsiveness
set updatetime=100

" Line numbering etc
set number relativenumber
set cursorline

" Indentation, splitting, etc
filetype plugin indent on
" show existing tab with n spaces width
set tabstop=2
" when indenting with '>', use n spaces width
set shiftwidth=2
" On pressing tab, insert spaces
set expandtab

" open new split panes to right and below
set splitright
set splitbelow

" Easier movement between splits
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" keep current line centered
set scrolloff=999

" turn off backup
set nobackup
set noswapfile
set nowritebackup

" Searching
set ignorecase
set smartcase

" Colourscheme
syntax enable
colorscheme nord

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_nord'

" Autopairs
let g:AutoPairsFlyMode = 1

" CoC
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Integrated terminal
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+b
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-b> :call OpenTerminal()<CR>
