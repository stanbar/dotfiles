function readme --description edit\ a\ README.md.\ If\ it\ doesn\'t\ exists,\ creates\ it
	if not [ -f README.md ]
    touch README.md
  end
  md README.md
end
