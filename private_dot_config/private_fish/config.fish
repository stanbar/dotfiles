# vim: set ft=fish:

set -x fish_color_normal normal
set -x fish_color_command 99cc99
set -x fish_color_quote ffcc66
set -x fish_color_redirection d3d0c8
set -x fish_color_end cc99cc
set -x fish_color_error f2777a
set -x fish_color_param d3d0c8
set -x fish_color_comment ffcc66
set -x fish_color_match 6699cc
set -x fish_color_selection white --bold --background=brblack
set -x fish_color_search_match bryellow --background=brblack
set -x fish_color_history_current --bold
set -x fish_color_operator 6699cc
set -x fish_color_escape 66cccc
set -x fish_color_cwd green
set -x fish_color_cwd_root red
set -x fish_color_valid_path --underline
set -x fish_color_autosuggestion 747369
set -x fish_color_user brgreen
set -x fish_color_host normal
set -x fish_color_cancel -r
set -x fish_pager_color_completion normal
set -x fish_pager_color_description B3A06D yellow
set -x fish_pager_color_prefix white --bold --underline
set -x fish_pager_color_progress brwhite --background=cyan

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x EDITOR nvim
set -x MARKDOWN_EDITOR Typora
set -x CHROME_EXECUTABLE "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

fish_add_path ~/.npm-global/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/go/bin
fish_add_path ~/dotfiles/bin
fish_add_path ~/bin
fish_add_path --prepend /usr/local/bin # prepend to be the first on the list

# Disable vim mode indicator
function fish_mode_prompt
    # NOOP
end

# vim mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

pyenv init - | source

zoxide init fish | source

# TMUX
if [ -z "$TMUX" ] ;
    set ID ( tmux ls | grep -m1 attached | cut -d: -f1 ) # get the id of a deattached session
    if [ -z "$ID" ] ;# if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    end
end
