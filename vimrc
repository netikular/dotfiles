" This is Kevin Pratt's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:
"

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'elixir-lang/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'andyl/vim-textobj-elixir'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set hlsearch
set cursorline
set ignorecase smartcase
syntax enable
filetype plugin on
set path+=**
set wildmenu
set wildignore+=*.o,*.obj,.git,tmp/cache/assets,tmp,*/vendor/assets/bower_components/*,coverage,paper_clip,tiles/*,node_modules/*,coverage/*
" display incomplete commands
set showcmd
set showmode
set laststatus=2
set showmatch
set incsearch
" If a file is changed outside of vim, automatically reload it without asking
set autoread

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

runtime macros/matchit.vim

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

autocmd BufEnter * EnableStripWhitespaceOnSave

let mapleader=","

" if executable("ag")
"     set grepprg=ag\ --nogroup\ --nocolor
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
" let g:ctrlp_map = '<Leader>tf'
" let g:ctrlp_show_hidden = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0

" Requires 'jq' (brew install jq)
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <leader>tf :Files <cr>
nnoremap <leader>tm :Files app/models/<cr>
nnoremap <leader>tv :Files app/views/<cr>
nnoremap <leader>tc :Files app/controllers/<cr>
nnoremap <leader>ty :Files app/assets/stylesheets/<cr>
nnoremap <leader>tj :Files app/assets/javascripts/<cr>
nnoremap <leader>tt :Files test/<cr>
nnoremap <leader>ts :Files spec/<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:elm_format_autosave = 1
nnoremap <leader>em :ElmMake<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:set background=dark
:color grb256

command! MakeTags !ctags -R .


nmap <Leader>tss :Ack!<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
" set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

command W w
nnoremap W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

" Clear the search buffer when hitting return
" function! MapCR()
"   nnoremap <cr> :nohlsearch<cr>
" endfunction
" call MapCR()


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%
