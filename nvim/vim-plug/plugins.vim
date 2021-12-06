" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.config/nvim/autoload/plugged")
  " Colourscheme
  Plug 'shaunsingh/nord.nvim'

  " NERDTree
  Plug 'preservim/nerdtree'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  " Plug 'tpope/vim-capslock'
  Plug 'easymotion/vim-easymotion'
  Plug 'alvan/vim-closetag'

  " Code completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Start screen
  Plug 'mhinz/vim-startify'

  " Icons (load last)
  Plug 'ryanoasis/vim-devicons'
call plug#end()
