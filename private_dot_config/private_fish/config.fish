# vim: set ft=fish:

set -U fish_color_normal normal
set -U fish_color_command 99cc99
set -U fish_color_quote ffcc66
set -U fish_color_redirection d3d0c8
set -U fish_color_end cc99cc
set -U fish_color_error f2777a
set -U fish_color_param d3d0c8
set -U fish_color_comment ffcc66
set -U fish_color_match 6699cc
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 6699cc
set -U fish_color_escape 66cccc
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 747369
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8
set -U EDITOR nvim

fish_add_path ~/.cargo/bin
fish_add_path ~/bin
fish_add_path ~/dotfiles/bin
fish_add_path ~/.local/bin
fish_add_path ~/go/bin

# Disable vim mode indicator
function fish_mode_prompt
    # NOOP
end

# vim mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

zoxide init fish | source
