if empty($XDG_DATA_HOME)
    let $XDG_DATA_HOME = $HOME."/.local/share"
endif


call plug#begin($XDG_DATA_HOME.'/nvim/plugged')

" common
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'simeji/winresizer'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'uarun/vim-protobuf', { 'for': 'protobuf' }
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }

" colorscheme
Plug 'yasukotelin/shirotelin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


syntax enable

set number
set cursorline
set title
set ruler
set nofoldenable
set noswapfile
set nobackup
set nowritebackup
set autoindent
set autowrite
set nojoinspaces
set ttyfast
set gdefault
set autoread
set hidden
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrapscan
set noerrorbells
set visualbell
set t_vb=
set scrolloff=8
set laststatus=2
set backspace=indent,eol,start
set nostartofline
set noshowmode
set showcmd
set listchars=tab:¦_,eol:¬
set history=256
set undofile
set clipboard+=unnamedplus

let mapleader = ','

nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Space> jzz
nnoremap <S-Space> kzz
nnoremap <C-b>c :bd<CR>
nnoremap <C-b>n :enew
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
nnoremap <Leader><Leader> :up<CR>
inoremap jj <ESC>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

filetype plugin indent on


" NERDTree
let g:NERDTreeChDirMode = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore=['\.DS_Store$']
nnoremap <Leader>f :NERDTreeToggle<CR>


" ctrlp
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_max = 500
let g:ctrlp_custom_ignore = 'DS_Store\|\.git\|\.hg\|\.svn\|node_modules'
let g:ctrlp_open_new_file = 1


" vim-gitgutter
set signcolumn=yes
set updatetime=250


" coc.nvim
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nnoremap <silent> U :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :call CocAction('format')
autocmd CursorHold * silent call CocActionAsync('highlight')


" colorscheme
set t_Co=256
set nocursorline
set guicursor=
set cmdheight=2
colorscheme shirotelin

let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'xtermlight'
