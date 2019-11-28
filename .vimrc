" --------------------------------------------------------------------------- "
" ------------------------------- General ----------------------------------- "
" --------------------------------------------------------------------------- "

" Encryption method
set cm=blowfish2

" Turn off the compatibility mode. (Always use the latest Vim features.)
set nocp

" Use 256 colors (Use this setting only if your terminal supports 256 colors)
set t_Co=256

" Automatically reload changed files.
set autoread

" Show (partial) command in the last line of the screen.
set showcmd

" Disable swap files
set nobackup
set noswapfile

" Make the backspace function properly
set backspace=indent,eol,start

" Yank/Paste in an out of Vim
set clipboard^=unnamed,unnamedplus

" Preserve clipboard contents when exiting Vim:
" OPTION 1: copy to xclip on exit
" autocmd VimLeave * call system("xclip -o | xclip -selection c") " WARNING: LINUX ONLY!!!
" OPTION 2: Install Parcellite or glipper for Gnome, or klipper for KDE:
" sudo apt-get install parcellite
" TODO: Find a clean, x-platform solution for this

" TAB/INDENTATION STUFF
filetype plugin indent on

set autoindent " Turn on the auto-intentation feature.
set tabstop=2  " Display tabs as 2 whitespace characters.
set expandtab " On pressing tab, insert 2 spaces

" When indenting with '>' or '<', use 2 whitespaces.
set shiftwidth=2 " <------------------------------------- PROBLEMATIC WITH nginx AND OTHER CONFIGURATION FILES. When set to 4 works fine.

" Highlight columns 80 and 100.
set colorcolumn=80,100

" Highlight all search results.
set hlsearch
" Enable incremental searching.
set incsearch

" Always show statusline
set laststatus=2
set showtabline=1
set noshowmode


syntax on " Use syntax coloring
set number " Always show line numbers
set relativenumber " Use relative line numbering

" --------------------------------------------------------------------------- "
" ------------------------------ Filetypes ---------------------------------- "
" --------------------------------------------------------------------------- "

" nginx filetype configuration
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

" --------------------------------------------------------------------------- "
" ------------------------------- Plugins ----------------------------------- "
" --------------------------------------------------------------------------- "

" Use the `codedark` theme (Visual Studio like)
colorscheme codedark

" Add Powerline Vim binding to the Runtime Path.
set rtp+=/home/d.dimitric/.local/lib/python2.7/site-packages/powerline/bindings/vim/  " Linux
" set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/ " MacOS

" Enable pathogen!
execute pathogen#infect()

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:statline_syntastic = 0

" ------------------------- Language Specific ------------------------------- "

" Syntastic for C programming
" Include the SDL2 directory so that errors are not being shown
let g:syntastic_c_include_dirs = ['/usr/local/include/SDL2']

" Syntastic for C++ programming
" Include the SDL2 directory so that errors are not being shown
let g:syntastic_cpp_include_dirs = ['/usr/local/include/SDL2']

" Syntastic - JavaScript + ESLint
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint' " Use the project-specific 'eslint' binary

" Syntastic - TypeScript + ESLint
let g:syntastic_typescript_checkers=['eslint']
let g:syntastic_typescript_eslint_exe='$(npm bin)/eslint' " Use the project-specific 'eslint' binary

" Tsuquyomi - Disable `tsc` checking, so that it doesn't interfere with Syntastic
let g:tsuquyomi_disable_quickfix = 1

" vim-go
" TODO: See if this is necessary
let g:go_bin_path = "/usr/local/go/bin"

" ----------------------------- Other Plugins ------------------------------- "

" NERDTree - always show hidden files
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" nerdcommenter
let g:NERDDefaultAlign = 'left' " Prevents nesting the comments
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDAltDelims_c = 1 " Uses // instead of /* */ by default

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set wildignore+=*.pyc                       " < ---------- Python
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " < ---------- Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " < ---------- Windows

" indentLine
let g:indentLine_char = '⎸'
let g:indentLine_color_term = 0

" vim-json
let g:vim_json_syntax_conceal = 0
set conceallevel=0 " Don't conceal matching quotes and stuff

" vim-gitgutter
set updatetime=500 " <- refresh vim buffers every 500ms

" --------------------------------------------------------------------------- "
" ------------------------------ Mappings ----------------------------------- "
" --------------------------------------------------------------------------- "

map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-j> :NERDTreeFind<CR>

" CTRL + s - Save
" https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
noremap  <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" https://hashrocket.com/blog/posts/8-great-vim-mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>
