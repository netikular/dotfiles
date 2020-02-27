# Defined in /var/folders/41/nkp05ghj62n30rc83fqvch8h0000gn/T//fish.VIu2Ab/g.fish @ line 2
function g
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
