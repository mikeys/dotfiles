dotfiles
========

##### Fix for vim-tmux-navigator (https://github.com/neovim/neovim/issues/2048#issuecomment-78045837):

```bash
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

##### Install gem-ctags and gem-browse
gem-browse: (https://github.com/tpope/gem-browse)
gem-ctags: (https://github.com/tpope/gem-ctags)

##### Install antigen
brew install antigen
