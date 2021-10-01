# Requirements

**git** - for pulling vim plugins

**ripgrep** - used for project-wide search/replace, useful `ripgrep` resources:
- https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/

**fzf** - used for fuzzy searching, useful `fzf` resources:
- https://dev.to/vintharas/5-minutes-vim-ctrlp-considered-harmful-48eg
- https://www.youtube.com/watch?v=qgG5Jhi_Els

**Universal ctags**
- https://github.com/universal-ctags/ctags

## MacOS Specific

Reinstall `vim` on MacOS, because the stock one is not the latest and does not have the necessary features enabled, such as `+clipboard`

# Vim

## Installing plugins and theming:

Run the setup script:

```
./vim_setup.sh
```

## Theme

The theme is called `codedark`, influenced by Visual Studio colors.

## Vim Testing

### Check the test project:
  - [ ] `cd ts-eslint-test && npm install`
  - [ ] `vim .` <- Check if NERDTree is working
  - [ ] Check if `syntax highlighting` works
  - [ ] Check if `linting` works
  - [ ] Check if `CTRL + S` (`CMD + S`) saves files
  - [ ] Check if `prettier` works
  - [ ] Check if `copy & paste` works
  - [ ] Check if `FZF` works
  - [ ] Check if `RipGrep` works
  - [ ] Check if `ctags` works (`ctags` to build the tags, it should use the config from `~/.ctags.d/*.ctags`)

# Bash

A bash framework called [bash-it](https://github.com/Bash-it/bash-it) is used, along with its `pro` theme.

**LINUX:** Make sure to add the following line to the bottom of your `.bashrc`:
```
stty -ixon
```

This will prevent the [terminal emulator hang](https://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator), when pressing `CTRL-s`.
