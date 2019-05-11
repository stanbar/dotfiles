## DotFiles (Fish)

A set of environment variables, functions and aliases for the Fish shell. Nothing here will gonna work for bash or zsh.

### Instalation

- Install [Fish](https://fishshell.com/) `brew install fish` and set it up as the default shell
- Clone this `git clone git@github.com:stasbar/dotfiles-fish.git ~/dotfiles/fish`
- softlink fish functions `ln -s ~/dotfiles/fish/functions ~/.config/fish/functions` so they are avaiable via `funced` and `funcsave` fish utils
- Source other content by appending `profile.sh` to the `config.fish ` with `echo 'source ~/dotfiles/fish/profile.fish' >> ~/.config/fish/config.fish`