call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'Townk/vim-autoclose'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'Shougo/neomru.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'benekastah/neomake'
Plug 'vim-scripts/matchit.zip'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

" Colors
Plug 'gregsexton/Atom'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jdkanani/vim-material-theme'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'tstelzer/welpe.vim'
Plug 'notpratheek/vim-luna'
Plug 'zandrmartin/vim-distill'
Plug 'scwood/vim-hybrid'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'trevorrjohn/vim-obsidian'
Plug 'vim-scripts/obsidian2.vim'
Plug 'atelierbram/vim-colors_duotones'
Plug 'joshdick/onedark.vim'
Plug 'mkarmona/colorsbox'

call plug#end()

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

syntax enable
" let g:solarized_termcolors=256
set background=dark
" colorscheme solarized
" colorscheme brogrammer
" or any of the other schemes:
" colorscheme duotone-darkearth
" colorscheme duotone-darkdesert
" colorscheme duotone-darkforest
" colorscheme duotone-darkpark
" colorscheme duotone-darkmeadow
" colorscheme duotone-darksea
" colorscheme duotone-darkpool
" colorscheme duotone-darkspace
" colorscheme duotone-dark
" colorscheme duotone-darkheath
" colorscheme duotone-darkcave
colorscheme colorsbox-material

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guifont=Droid\ Sans\ Mono\ 11

nnoremap <S-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <S-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <S-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Tab navigation like Firefox.
map <C-S-Tab> :tabprevious<CR>
map <C-Tab>   :tabnext<CR>
map <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

set rtp+=~/.fzf

" FZF {{{
" <C-p> or <C-t> to search files
nnoremap <silent> <C-t> :FZF -m<cr>
nnoremap <silent> <C-p> :FZF -m<cr>

" <M-p> for open buffers
nnoremap <silent> <M-p> :Buffers<cr>

" <M-S-p> for MRU
nnoremap <silent> <M-S-p> :History<cr>

" Use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" Better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap q/ :QHist<CR>

command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
" }}}
