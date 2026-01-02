function ossh_prod
  echo "connecting to "$argv
  ssh $argv.$OSS_PROD_HOST
end
