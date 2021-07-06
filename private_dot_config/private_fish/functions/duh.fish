# Defined in - @ line 1
function duh --description 'alias duh du -d 0 -h * | sort -h'
	du -d 0 -h * | sort -h $argv;
end
