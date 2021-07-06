function url-final-part --description 'get the final part of a string separated by /'
	echo (string split "/" $argv[1])[-1]
end
