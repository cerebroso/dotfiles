call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'Townk/vim-autoclose'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neomru.vim'

call plug#end()

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable = 1

let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
endif

"nnoremap <C-p> :Unite file/async file_rec/async file_mru<cr>
"nnoremap <C-p> :Unite -buffer-name=files file/async:!<cr>
nnoremap <silent> <c-p> :Unite -auto-resize file/async file_mru file_rec<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
