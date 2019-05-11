function file-extension --description 'get extension of a given file name'
	echo (string split . $argv[1])[-1]
end
