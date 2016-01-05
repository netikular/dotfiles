function p
	switch $argv
    case list
      echo (project_path --list)
    case '*'
      cd $HOME(project_path $argv)
  end
end
