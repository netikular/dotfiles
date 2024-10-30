function nf
  source ~/.config/notes/init.fish

  set opts (parse_opts $argv | string split "\n")

  pushd $VAULT_ROOT/$opts[1]
  vim -c "Telescope live_grep"
  commit_notes
  popd
end
