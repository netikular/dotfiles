# Defined in /var/folders/41/nkp05ghj62n30rc83fqvch8h0000gn/T//fish.9Ig9gX/vim.fish @ line 2
function vim
	if set -q NVIM_LISTEN_ADDRESS
    nvr -cc split --remote-wait +'set bufhidden=wipe' $argv
  else
    nvim  $argv;
  end
end
