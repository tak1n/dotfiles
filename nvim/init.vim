scriptencoding utf-8
set encoding=utf-8

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tinted-theming/base16-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
" Javascript/Typescript plugins
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prisma/vim-prisma'
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

syntax on                         " show syntax highlighting
filetype plugin indent on
filetype on
filetype indent on
set termguicolors

let base16_background_transparent=1
colorscheme base16-nord

set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set sw=2
set sts=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set cursorcolumn
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamedplus             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set encoding=utf-8                " The encoding displayed.
set fileencoding=utf-8            " The encoding written to file.
set synmaxcol=800                 " don't highlight lines longer than 800
set noshowmode

noremap <ScrollWheelUp>      <nop>
noremap <S-ScrollWheelUp>    <nop>
noremap <C-ScrollWheelUp>    <nop>
noremap <ScrollWheelDown>    <nop>
noremap <S-ScrollWheelDown>  <nop>
noremap <C-ScrollWheelDown>  <nop>
noremap <ScrollWheelLeft>    <nop>
noremap <S-ScrollWheelLeft>  <nop>
noremap <C-ScrollWheelLeft>  <nop>
noremap <ScrollWheelRight>   <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>

syntax enable

" set background=dark

syn match Todo "@todo" "@TODO" TODO todo contained

" set up some custom colors
hi clear CursorLine
" hi ColorColumn  ctermbg=50
" hi LineNr       ctermbg=236 ctermfg=240
" hi CursorLineNr ctermfg=2 cterm=bold ctermbg=235
" hi CursorLine   ctermbg=235
" hi CursorColumn ctermbg=235
" hi Pmenu ctermfg=2 ctermbg=235

" set leader key to comma
let mapleader = ","

" map git commands
map <leader>log :!clear && git log -p %<cr>
map <leader>dif :!clear && git diff %<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Organize TypeScript Imports
nmap <leader>i :CocCommand tsserver.organizeImports<cr>

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=100
endif

" jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
imap <S-Up> <nop>
imap <S-Down> <nop>
vmap <S-Up> <nop>
vmap <S-Down> <nop>
nmap <S-Up> <nop>
nmap <S-Down> <nop>

hi SpellBad ctermfg=0 ctermbg=2
hi SpellCap ctermfg=0 ctermbg=2

set linespace=0

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green ctermbg=0
highlight GitGutterChange ctermfg=yellow ctermbg=0
highlight GitGutterDelete ctermfg=red ctermbg=0
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=0

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
