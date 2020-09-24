" plugins
"
call plug#begin()

" auto pair brackets
Plug 'jiangmiao/auto-pairs'

" color-themes
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/zenburn'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', { 'as': 'dracula' }

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vimux
Plug 'benmills/vimux'

" fuzzy file search
Plug 'kien/ctrlp.vim'

" Sourround 
Plug 'tpope/vim-surround'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" undo tree
Plug 'mbbill/undotree'

" Docker stuff 
Plug 'kevinhui/vim-docker-tools'

" git gutter (preview diff) 
Plug 'airblade/vim-gitgutter'

" Conquer of Completion
" build Coc form source code when required
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" go lang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" scala lang
Plug 'derekwyatt/vim-scala'

call plug#end()

filetype plugin indent on 
syntax on

" File encodings
"
set encoding=utf-8
set ffs=unix,mac,dos


" colors
"
set t_Co=256
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme dracula

" editor appearance 
"
set cursorline
set number
set numberwidth=2
set linespace=3
set cmdheight=2
set ruler
set cc=83
set tw=95
" set lines=36 columns=110
set mouse=a

set noeb vb t_vb=		" please, be quite

" tabbing
"
set tabstop=4 
set softtabstop=4 
set shiftwidth=4


" toggle invisible characters
"
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" diff options
set diffopt=vertical,filler,context:3

" +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
" new key mappings
" +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"
let mapleader = ","

" Easy Copy + Past
"
vmap <C-c> "+yi<ESC>
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" line moves
"
nnoremap <A-DOWN> :m .+1<CR>==
nnoremap <A-UP> :m .-2<CR>==

inoremap <A-DOWN> <Esc>:m .+1<CR>==gi
inoremap <A-UP> <Esc>:m .-2<CR>==gi

vnoremap <A-DOWN> :m '>+1<CR>gv=gv
vnoremap <A-UP> :m '<-2<CR>gv=gv


" window movements
"
nnoremap <C-X><DOWN> <C-W><C-J>
nnoremap <C-X><UP> <C-W><C-K>
nnoremap <C-X><RIGHT> <C-W><C-L>
nnoremap <C-X><LEFT> <C-W><C-H>

:nnoremap <C-b> :NERDTreeToggle<CR>

" -------------------------------------------------------------------------------- 
" coc.nvim default settings
" -------------------------------------------------------------------------------- 
let g:coc_node_path='/usr/bin/node'

" if hidden is not set, TextEdit might fail.
set hidden

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions = 1
let g:go_auto_type_info = 1

