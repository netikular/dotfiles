function nn
  source ~/.config/notes/init.fish

  set opts (parse_opts $argv | string split "\n")

  pushd $VAULT_ROOT/$opts[1]
  nvim $opts[2]
  commit_notes
  popd

end
