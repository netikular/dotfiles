# Connect to a fly staging server
function flysc
    fly console -c fly.staging.toml --vm-memory 2048
end
