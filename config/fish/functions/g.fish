function g
	if test 0 -eq (count $argv)
        git status
    else
        git $argv
    end
end
