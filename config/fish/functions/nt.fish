function nt
  source ~/.config/notes/init.fish

  set opts (parse_opts $argv | string split "\n")

  pushd $VAULT_ROOT/$opts[1]

  set -l tasks (rg -n "^\- \[ \]" ./ )

  set task (for task in $tasks
    set parts (echo $task | string split -r -m1 ":- [ ]")[-1..1]

    echo $parts[1]"**"$parts[2]

  end | column -s "**" -t | fzf
  or popd && return
  )
  set parts (string split "./" -- $task)
  set file_parts (string replace -ar "\s+" " " -- $parts[2] | string split ":" -m2 -r)
  vim +$file_parts[2] $file_parts[1] -c "norm 3l"
  commit_notes
  popd
end
