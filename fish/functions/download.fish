function download --description 'download a file in the current dir from the url '
	curl -o (url-final-part $argv[1]) $argv[1]
end
