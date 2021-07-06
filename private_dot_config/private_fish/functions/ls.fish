function ls --wraps='trans pl:en' --wraps='exa --icons' --description 'alias ls=exa --icons'
  exa --icons $argv; 
end
