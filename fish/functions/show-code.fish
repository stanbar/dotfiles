function show-code --description 'Show the code in a less-powered highlighted view'
	set filename $argv[1]
  set syntax (file-extension $argv[1])
  set format "xterm256"

  cat $filename | highlight --syntax=$syntax --out-format=$format | less -R
end
