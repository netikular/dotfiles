# Connect to a production fly console
function flypc
    fly console -c fly.production.toml --vm-memory 2048
end
