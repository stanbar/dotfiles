# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/stasbar/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/stasbar/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/stasbar/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/stasbar/.fzf/shell/key-bindings.zsh"

FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules --exclude .idea"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =- binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

export BAT_PAGER="less -R"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude "node_modules" . "$1"
}
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" --exclude "node_modules" . "$1"
}

