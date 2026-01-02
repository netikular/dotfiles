function ne
  source ~/.config/notes/init.fish

  set opts (parse_opts $argv | string split "\n")

  pushd $VAULT_ROOT/$opts[1]
  nvim -c "Telescope find_files"
  commit_notes
  popd
end
