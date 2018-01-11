set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

function! Solarized()
  let g:solarized_use16 = 1
  colorscheme solarized8
endfunction

function! PresentationMode()
  let g:solarized_use16 = 1
  colorscheme solarized8
  let g:background=light
endfunction

set iskeyword+=-
