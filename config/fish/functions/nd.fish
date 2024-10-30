function nd

  pushd ~/Projects/notes
  set date (date +%Y-%m-%d)
  vim "$date.md"
  popd
end
