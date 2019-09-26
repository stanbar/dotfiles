# dotfiles

My dotfiles, a constantly evolving set of configurations which I arguably spend too much time tweaking, but they make the command line feel like home, so here we are.

Clone this repo into ~/dotfiles with `git clone git@github.com:stasbar/dotfiles-fish.git ~/dotfiles`

## Vim

```bash
ln -s ~/dotfiles/vim/.vimrc ~/
ln -s ~/dotfiles/vim/colors ~/.vim/

# if you want polish spelling support
mkdir ~/.vim/plugin
ln -s ~/dotfiles/vim/plugin/polish.vim ~/.vim/plugin/
```

## Zsh

This is platform specific profile, so replace <platform> with either *macos* or *linux*.
```bash
ln -s ~/dotfiles/zsh/<platform>/.zshrc ~/
```

## Oh-my-zsh

```bash
ln -s ~/dotfiles/oh-my-zsh/*.zsh ~/.oh-my-zsh/custom/
ln -s ~/dotfiles/oh-my-zsh/themes/*.zsh-theme ~/.oh-my-zsh/custom/themes/
```

## i3

```bash
ln -s ~/dotfiles/i3/config ~/.config/i3/
```

## Xorg

```bash
ln -s ~/dotfiles/xorg/.Xresources ~/
ln -s ~/dotfiles/xorg/.Xmodmap ~/
ln -s ~/dotfiles/xorg/.xinitrc ~/
```


## fish

A set of environment variables, functions and aliases for the Fish shell. Nothing here will gonna work for bash or zsh.

- Install [Fish](https://fishshell.com/) `brew install fish` and set it up as the default shell

- softlink fish functions `ln -s ~/dotfiles/fish/functions ~/.config/fish/functions` so they are avaiable via `funced` and `funcsave` fish utils

- Source other content by appending `profile.sh` to the `config.fish ` with `echo 'source ~/dotfiles/fish/profile.fish' >> ~/.config/fish/config.fish`⏎ 

## Terminal and iTerm JetBrains Darcula theme

[iTerm](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/JetBrains%20Darcula.itermcolors)
[Terminal](https://github.com/lysyi3m/macos-terminal-themes/blob/master/schemes/JetBrains%20Darcula.terminal)

