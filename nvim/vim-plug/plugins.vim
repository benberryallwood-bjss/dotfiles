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
  Plug 'EdenEast/nightfox.nvim'
  Plug 'jeffkreeftmeijer/vim-dim'

  " File tree
  Plug 'preservim/nerdtree'
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'folke/which-key.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  Plug 'jiangmiao/auto-pairs'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'idanarye/vim-merginal'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-rhubarb'

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  " Plug 'tpope/vim-capslock'
  Plug 'easymotion/vim-easymotion'
  Plug 'alvan/vim-closetag'

  " Code completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Latex
  Plug 'lervag/vimtex'

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Tests
  Plug 'vim-test/vim-test'

  " Start screen
  Plug 'mhinz/vim-startify'

  " Icons (load last)
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons' " for nvim-tree
call plug#end()
