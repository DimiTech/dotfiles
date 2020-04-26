# Requirements

## **git** - for pulling vim plugins

## **ripgrep** - used for project-wide search/replace

Useful `ripgrep` resources:
- https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/

## **fzf** - used for fuzzy searching

Useful `fzf` resources:
- https://dev.to/vintharas/5-minutes-vim-ctrlp-considered-harmful-48eg
- https://www.youtube.com/watch?v=qgG5Jhi_Els

## MacOS Specific

Reinstall `vim` on MacOS, because the stock one is not the latest and does not have the necessary features enabled, such as `+clipboard`

# Vim

## Installing plugins and theming:

The following plug-ins are used:
```
coc

fzf.vim (https://github.com/junegunn/fzf.vim)

nerdtree

indentLine
supertab
tcomment (https://github.com/tomtom/tcomment_vim)
tabularize
surround.vim
vim-auto-pair
rainbow (https://github.com/luochen1990/rainbow)
vim-json

vim-gitgutter
vim-fugitive

diffchar

emmet-vim

" Language-specific:

" Typescript
typescript-vim
tsuquyomi

" Go
vim-go (https://github.com/fatih/vim-go)
```

## Theme

The theme is called `codedark`, influenced by Visual Studio colors.

## JavaScript syntax support

Syntastic works well with `eslint`, just make sure that `eslint` is installed globally as well as locally: `npm i -g eslint`

There is an example project embedded in this repo called `ts-eslint-test` that you can use to test out if `eslint` is working properly inside `vim`.

If the linter doesn't work, try debugging `syntastic` by opening a `typescript` file and executing the following commands in vim:

```
:let g:syntastic_debug=3
:SyntasticCheck eslint
:mes
```

## nginx syntax support:

Here is how to set it up:
* https://serverfault.com/a/782503

## vim-go - Installation

In order to run `:GoInstallBinaries` from vim and for it to work, make sure to run vim as a superuser: `sudo vim`, and then run `:GoInstallBinaries`.

# Bash

A bash framework called `bash-it` is used, along with its `pro` theme.

**LINUX:** Make sure to add the following line to the bottom of your `.bashr`:
```
stty -ixon
```

This will prevent the [terminal emulator hang](https://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator), when pressing `CTRL-s`.
