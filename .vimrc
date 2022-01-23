runtime! archlinux.vim
:filetype plugin on
:syntax on
:set number
:set relativenumber
:set ignorecase
:set smartcase
:set mouse=a
:set title
" swap and backup dirs
:set directory=~/.local/share/vim/swap
:set backupdir=~/.local/share/vim/tmp


" change the cursor shape depending on the mode
" let &t_SI = "\e[5 q"
" let &t_EI = "\e[1 q"

" reset cursor on start
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[1 q"
" augroup END

" Integrating with powerline fonts
let g:airline_powerline_fonts = 1
