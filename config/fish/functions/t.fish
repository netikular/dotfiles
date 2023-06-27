function t
	tmux new -s (string sub --length 8 (basename (pwd)))
end
