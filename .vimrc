" --------------------------------------------------------------------------- "
" ------------------------------- General ----------------------------------- "
" --------------------------------------------------------------------------- "

" Set SPACE as LEADER
map <SPACE> <leader>

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

" Open new vertical split to the right
set splitright
" Open new horizontal split to the bottom
set splitbelow

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

" ------------------------------- General ----------------------------------- "

" Use the `codedark` theme (Visual Studio like)
colorscheme codedark

" Activate rainbow
let g:rainbow_active=1

" ------------------------- Language Specific ------------------------------- "


" ----------------------------- Other Plugins ------------------------------- "

" NERDTree - always show hidden files
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" fzf
set rtp+=/usr/bin/fzf       " Add fzf to Runtime Path (Linux)
set rtp+=/usr/local/opt/fzf " Add fzf to Runtime Path (MacOS)
" git search - https://github.com/junegunn/fzf.vim/issues/121#issuecomment-575922206
nnoremap <leader>gs :<C-u>GFiles --cached --others --exclude-standard<CR>
" All files search:
nnoremap <leader>s :<C-u>Files<CR>

" ripgrep
let g:rg_command = 'rg --vimgrep -S'
nnoremap <leader>r :<C-u>Rg 

" indentLine
let g:indentLine_char = '⎸'
let g:indentLine_color_term = 240

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
" MacOS - CMD + s - Save in Vim running in iTerm2: http://superuser.com/a/1246848
noremap  <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" https://hashrocket.com/blog/posts/8-great-vim-mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>

" --------------------------------------------------------------------------- "
" ---------------------------- Abbreviations -------------------------------- "
" --------------------------------------------------------------------------- "

" https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations/11865489#11865489
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" C
:autocmd FileType c iabbr #i #include <><Left><C-R>=Eatchar('\s')<CR>
:autocmd FileType c iabbr cl printf("\n");<Esc>F\i<C-R>=Eatchar('\s')<CR>
:autocmd FileType c iabbr forl for (int i = 0; i < ; ++i) {<Enter>}<esc>k$7hi
:autocmd FileType c iabbr fn void () {<Enter><Enter>}<Up><Up><C-O>W<C-R>=Eatchar('\s')<CR>

" JavaScript
:autocmd FileType javascript iabbr cl console.log()<C-O>F)<C-R>=Eatchar('\s')<CR>
" inoremap version of console.log
" :autocmd FileType javascript inoremap cl console.log('');<C-O>F'<C-R>=Eatchar('\s')<CR>
:autocmd FileType javascript iabbr forl for (int i = 0; i <; ++i) {<Enter>}<esc>k$7hi
:autocmd FileType javascript iabbrev fn function () {<Enter><Enter>}<Up><Up><C-O>W<C-O>l<C-R>=Eatchar('\s')<CR>
" Without Eatchar()
" :autocmd FileType javascript iabbrev fn function () {<Enter><Enter>}<Up><Up><C-O>W

" Java
:autocmd FileType java iabbr psvm public static void main(String[] args){<CR>}<esc>O
