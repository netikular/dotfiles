# Defined in /var/folders/41/nkp05ghj62n30rc83fqvch8h0000gn/T//fish.cEnU8r/gpo.fish @ line 2
function gpo
	git push -u origin (git rev-parse --abbrev-ref HEAD)
end
