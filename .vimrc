" Turn off the compatibility mode. (Always use the latest Vim features.)
set nocp

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" TAB/INDENTATION STUFF
filetype plugin indent on
" Turn on the auto-intentation feature.
set autoindent
" Display tabs as 4 whitespace characters.
set tabstop=4
" When indenting with '>' or '<', use 4 whitespaces.
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Highlight columns 80 and 100.
set colorcolumn=80,100

" Highlight all search results.set
set hlsearch

" Always show statusline
set laststatus=2
set showtabline=1
set noshowmode

" Use syntax coloring
syntax on
" Always show line numbers
set number
" Use relative line numbering
set relativenumber

" --------------------------------------------------------------------------- "

" Add Powerline Vim binding to the Runtime Path.
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Enable pathogen!
execute pathogen#infect()

" Use the `codedark` theme (Visual Studio like)
colorscheme codedark

" Syntactic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntactic + ESLint
let g:syntastic_javascript_checkers=['eslint']

" Use the project-specific 'eslint' binary
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

