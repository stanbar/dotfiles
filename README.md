# dotfiles

My dotfiles, a constantly evolving set of configurations which I arguably spend too much time tweaking, but they make the command line feel like home, so here we are.

Clone this repo into ~/dotfiles with `git clone git@github.com:stasbar/dotfiles-fish.git ~/dotfiles`

## Vim

#### instalation
```bash
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```

## fish

A set of environment variables, functions and aliases for the Fish shell. Nothing here will gonna work for bash or zsh.

#### Instalation

- Install [Fish](https://fishshell.com/) `brew install fish` and set it up as the default shell

- softlink fish functions `ln -s ~/dotfiles/fish/functions ~/.config/fish/functions` so they are avaiable via `funced` and `funcsave` fish utils

- Source other content by appending `profile.sh` to the `config.fish ` with `echo 'source ~/dotfiles/fish/profile.fish' >> ~/.config/fish/config.fish`⏎ 