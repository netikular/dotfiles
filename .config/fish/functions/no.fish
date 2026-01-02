function no
  source ~/.config/notes/init.fish

  set opts (parse_opts $argv | string split "\n")

  pushd $VAULT_ROOT/$opts[1]

  set file_name (fzf --preview "glow -s dark -w 60 {}")
  set url (string replace "%f" $file_name "obsidian://open?vault=$opts[1]&file=%f")

  open $url

  popd
end
