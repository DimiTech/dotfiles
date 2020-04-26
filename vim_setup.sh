#!/usr/bin/env bash

###############################################################################
#
# Everything is installed using the Vim 8 Plugin System!
#
###############################################################################

# codedark theme
git clone https://github.com/tomasiser/vim-code-dark.git $HOME/.vim/

# Copy the .vimrc
cp .vimrc $HOME/.vimrc

###############################################################################

# Installing plugins using Vim 8 package manger:
# https://stories.abletech.nz/get-rid-of-your-vim-plugin-manager-7c8ff742f643#.abnjauzgk

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}
# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}

(
set_group vendor
package https://github.com/junegunn/fzf.vim.git
package https://github.com/jremmen/vim-ripgrep
package https://github.com/Yggdroot/indentLine.git
package https://github.com/preservim/nerdtree.git
package https://github.com/tomtom/tcomment_vim
package https://github.com/ervandew/supertab.git
package https://github.com/godlygeek/tabular
package https://github.com/tpope/vim-surround.git
package https://github.com/jiangmiao/auto-pairs.git
package https://github.com/luochen1990/rainbow
package https://github.com/airblade/vim-gitgutter.git
package https://github.com/mattn/emmet-vim.git
package https://github.com/elzr/vim-json.git
package https://github.com/dense-analysis/ale.git
package https://github.com/leafgarland/typescript-vim.git
wait

) &

wait

# Add documentation:
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/indentLine/doc" -c "q"
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/ale/doc" -c "q"
