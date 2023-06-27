function g --wraps=git
	if test 0 -eq (count $argv)
    git status
  else if test 1 -eq (count $argv)
    if test "po" = "$1"
      git push -u origin (git rev-parse --abbrev-ref HEAD)
    else
      git $argv
    end
  else
    git $argv
  end
end
