function fish_prompt --description 'Write out the prompt'
	set -l mode_str
  switch "$fish_key_bindings"
  case '*_vi_*' '*_vi'
    # possibly fish_vi_key_bindings, or custom key bindings
    # that includes the name "vi"
    set mode_str (
      echo -n " "
      switch $fish_bind_mode
      case default
        set_color --bold --background red white
        echo -n "[N]"
      case insert
        set_color --bold green
        echo -n "[I]"
      case visual
        set_color --bold magenta
        echo -n "[V]"
      end
      set_color normal
    )
  end

  set -l git_string (set_color f3e)(__fish_git_prompt)

  echo -n -s (set_color $fish_color_cwd) (basename (prompt_pwd)) "$git_string "(set_color normal) ">️"
end
