function _ssh
  ssh $1
end

function ossh_stage
  echo "connecting to "$argv
  ssh $argv.$OSS_STAGE_HOST
end
