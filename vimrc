" This is Kevin Pratt's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

packadd minpac
call minpac#init()
call minpac#add('andyl/vim-textobj-elixir')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('robertmeta/nofrils')
" call minpac#add('elixir-lang/vim-elixir')
" call minpac#add('ElmCast/elm-vim')
"
call minpac#add('hauleth/blame.vim')
call minpac#add('elm-tooling/elm-vim')
call minpac#add('elzr/vim-json')
" call minpac#add('itchyny/lightline.vim')
call minpac#add('jceb/vim-orgmode')
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('kana/vim-textobj-user')
call minpac#add('mxw/vim-jsx')
call minpac#add('jparise/vim-graphql')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('ntpeters/vim-better-whitespace')
call minpac#add('pangloss/vim-javascript')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('reasonml-editor/vim-reason-plus')
call minpac#add('rust-lang/rust.vim')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-speeddating')
call minpac#add('tpope/vim-surround')
" call minpac#add('tpope/vim-unimpaired')
call minpac#add('w0rp/ale')
call minpac#add('rizzatti/dash.vim')
call minpac#add('rhysd/vim-crystal')
call minpac#add('netikular/vim-fish')
" Themes
call minpac#add('vim-scripts/xoria256.vim')
call minpac#add('jnurmine/zenburn')
call minpac#add('lifepillar/vim-solarized9')
call minpac#add('arcticicestudio/nord-vim')

call minpac#add('mileszs/ack.vim')
call minpac#add('kassio/neoterm')
call minpac#add('janko-m/vim-test')
call minpac#add('toyamarinyon/vim-swift')
" call minpac#add('slashmili/alchemist.vim')
call minpac#add('sukima/vim-tiddlywiki')
call minpac#add('posva/vim-vue')
" call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
" call minpac#add('andys8/vim-elm-syntax', { 'for': ['elm'] })
" if has('nvim')
"   call minpac#add('autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' })
"   call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
" else
"   call minpac#add('autozimu/LanguageClient-neovim')
"   call minpac#add('Shougo/deoplete.nvim')
"   call minpac#add('roxma/nvim-yarp')
"   call minpac#add('roxma/vim-hug-neovim-rpc')
" endif

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set cursorline
" syntax off
filetype plugin indent on
" set path+=**
set wildmenu
set wildignore+=*.o,*.obj,.git,tmp/cache/assets,tmp,*/vendor/assets/bower_components/*,coverage,paper_clip,tiles/*,node_modules/*,coverage/*
" display incomplete commands
set showcmd
set showmode
set laststatus=2
set showmatch
" If a file is changed outside of vim, automatically reload it without asking
set autoread
set clipboard=unnamed

set rnu
set noshowmode

set winwidth=84
set winheight=10
set winminheight=10
set winheight=9999

" Use Bacspace in normal mode to remove the search
nmap <silent> <BS>  :nohlsearch<CR>

" This saves the file automatically so that when you're using
" I have this enabled so that if I've forgotten to save and use FZF
" To swtich files it saves it and opens the new file otherwise vim
" stops you from opening the file
set autowriteall

" set guifont=Inconsolata-g:h14


" This is needed for vim to work with % on ruby files
" nvim does not need this
if !(has("nvim"))
  runtime macros/matchit.vim
endif

set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

autocmd BufEnter * EnableStripWhitespaceOnSave

let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autofmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_preview=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minpac
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leaders
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>h :nohlsearch<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>b :Buffers<cr>
" nmap <leader>bl <c-^>
nmap <leader>p :call CocActionAsync('format')<cr>

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
au BufNewFile,BufRead *.es6 set filetype=javascript.jsx

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let $FZF_DEFAULT_OPTS = '--reverse'
nnoremap <leader>f :FZF <cr>
nnoremap <leader>s :call KAg()<cr>
" nnoremap <leader><plug>(fzf-complete-file-ag)

function! KAg()
  let string = input("Search: ")
  if !empty(string)
    call fzf#vim#ag(string, 0)
  else
    echo
  endif
endfunction

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:elm_format_autosave = 0
" nnoremap <leader>em :ElmMake<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=256 " 256 colors
" let g:solarized_use16 = 1
set termguicolors
set background=dark
" color xoria256
function! DefaultColor()
  " colorscheme grb256
  " colorscheme nord
  colorscheme solarized8
  " colorscheme blame
  " colorscheme zenburn
endfunction
call DefaultColor()

command! MakeTags !ctags -R .

map <C-g> <ESC>
map! <C-g> <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " \ 'reason': ['refmt'],
      " \ 'javascript': ['prettier'],
      " \ 'javascript': ['prettier'],
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'elixir': ['mix_format'],
      \ 'javascript': ['prettier'],
      \ 'javascript.jsx': ['prettier'],
      \}
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'elixir': ['mix_format'],
      \}

let g:ale_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_delay=1000
let g:ale_linters_explicit = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"     \ }

" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  let test#strategy='neoterm'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Light line configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dash
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dash_activate = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" persistent_undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better_whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoterm mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoterm_autoinsert=1
let g:neoterm_default_mod="botright"
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc>
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
highlight TermCursorNC ctermfg=4 guifg=none guibg=none
hi ErrorMsg ctermfg=1 ctermbg=4 guifg=none guibg=none guisp=NONE cterm=NONE,reverse gui=NONE
" hi Error ctermfg=160 ctermbg=4 guifg=#dc322f guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
"
augroup wayland_clipboard
  au!
  au TextYankPost * call system("ssh 10.0.1.201 say 'aset'", @")
augroup END
