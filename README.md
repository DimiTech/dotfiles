## Vim

### Installing plugins and theming:

The following plug-ins are used:
```
pathogen

powerline

syntastic

nerdtree
nerdcommenter
ctrlp

indentLine
supertab
surround.vim
rainbow (https://github.com/luochen1990/rainbow)
vim-json

vim-gitgutter
vim-fugitive

diffchar
silver
vim-ags

emmet-vim

" Language-specific:

" Typescript
typescript-vim
tsuquyomi

" Go
vim-go (https://github.com/fatih/vim-go)
```

### Theme

The theme is called `codedark`, influenced by Visual Studio colors.

### JavaScript syntax support

Syntastic works well with `eslint`, just make sure that `eslint` is installed globally as well as locally: `npm i -g eslint`

There is an example project embedded in this repo called `ts-eslint-test` that you can use to test out if `eslint` is working properly inside `vim`.

### nginx syntax support:

Here is how to set it up:
* https://serverfault.com/a/782503

### vim-go - Installation

In order to run `:GoInstallBinaries` from vim and for it to work, make sure to run vim as a superuser: `sudo vim`, and then run `:GoInstallBinaries`.

## Bash

A bash framework called `bash-it` is used, along with its `pro` theme.

**LINUX:** Make sure to add the following line to the bottom of your `.bashr`:
```
stty -ixon
```

This will prevent the [terminal emulator hang](https://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator), when pressing `CTRL-s`.
