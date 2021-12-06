source $XDG_CONFIG_HOME/nvim/vim-plug/plugins.vim

" Save cursor position and fold info
set viewoptions=cursor,folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

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

" Java
iabbr sout System.out.println()<ESC>

" Copy contents of current file to clipboard
command! CopyFile !cat %:p | pbcopy

" Set leader to space
let mapleader = " "

" Default 4000ms, for gitgutter responsiveness
set updatetime=100

" Line numbering etc
set number relativenumber
set cursorline

" Show fold symbols in column on left
set foldcolumn=1

" Indentation, splitting, etc
filetype plugin indent on
" show existing tab with n spaces width
set tabstop=4
" when indenting with '>', use n spaces width
set shiftwidth=4
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

set mouse=a
set nolazyredraw

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
" nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFocus<CR>

" start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

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

" ----------------------------------------------------------------------------
" CoC
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-java']

" Use <C-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>g  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" ----------------------------------------------------------------------------
" Integrated terminal
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+t
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <C-T> :call OpenTerminal()<CR>

" Startify options
" When opening a file or bookmark, seek and change to the root of the repo
let g:startify_change_to_vcs_root = 1
" Custom header empty (for now)
let g:startify_custom_header = ''
" Use environment variables in path if shorter
let g:startify_use_env = 1
" Set directory to save sessions
let g:startify_session_dir = '~/.config/nvim/session'

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

