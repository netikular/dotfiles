# My Fish Config
if status --is-interactive
  # eval "$(/opt/homebrew/bin/brew shellenv)"

  if set -q NVIM_LISTEN_ADDRESS
    set -x VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  else
    set -x VISUAL "nvim"
  end

  set __fish_git_prompt_char_dirtystate '*'
  set __fish_git_prompt_showdirtystate 'yes'
  set __fish_git_prompt_showstashstate 'yes'
  set ___fish_git_prompt_color_branch (set_color yellow)
  set ___fish_git_prompt_color_branch_done (set_color f3e)

# Set up completions
  complete -c g -w git
  complete -c gpo -w git
  complete -c e -w emacs

  ulimit -n 4096

  set -x CFLAGS "-O2 -g -fno-stack-check"
  # set -x KERL_CONFIGURE_OPTIONS "--disable-hipe --without-javac --with-ssl=/opt/homebrew/opt/openssl@1.1"
  # set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@3"
  # set -x PKG_CONFIG_PATH "/opt/homebrew/opt/libpq/lib/pkgconfig"

  atuin init fish | source

  oh-my-posh init fish --config ~/.config/zen.toml | source

end

# Variables
set -x EDITOR nvim
set -x VISUAL nvim
set -x MANPATH $MANPATH /usr/local/opt/erlang/lib/erlang/man
set -x TERM xterm-ghostty
# set -x TERM screen-256color
set -x XDG_CONFIG_HOME ~/.config

zoxide init fish | source

# Color scheme
# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 283457
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

function set_poshcontext --no-scope-shadowing
  set --export FISH__BIND_MODE $fish_bind_mode
end

function rerender_on_bind_mode_change --on-variable fish_bind_mode
    if test "$fish_bind_mode" != paste
        omp_repaint_prompt
    end
end
set_poshcontext

# set desired cursor styles
# NOTE: this will be necessary even in fish version with above PR released
set -U fish_cursor_default "block"
set -U fish_cursor_insert "line" "blink"
set -U fish_cursor_replace_one "underscore"
set -U fish_cursor_visual "block"

# enable vi cursor in Ghostty.
# NOTE: This won't be necessary when the PR above
#       gets released in some version of fish shell
if status is-interactive
    if string match -q -- '*ghostty*' $TERM
        set -g fish_vi_force_cursor 1
    end
end

# opencode
fish_add_path /Users/kevin/.opencode/bin
fish_add_path /home/kevin/.local/share/gem/ruby/3.4.0/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/kevin/.lmstudio/bin
# End of LM Studio CLI section

# Best way to get these functions installed into all fish sessions

function create_timer
  set issue $argv[1]
  set title (gh issue view $issue --jq .title --json title)
  harvest_cli -t $issue -n "$title"
end

function create_timer_trello
  set issue $argv[1]
  set title (trello_cli -c "$issue" -f title)
  harvest_cli -t $issue -n "$title"
end

function dev_issue_trello
  set issue $argv[1]
  set title (trello_cli -c "$issue" -f title)
  set branch_name (echo $issue"_"$title | string lower | string replace -a ' ' '_' | string replace -ar '[^a-z0-9_]' '')
  git checkout -b $branch_name
  harvest_cli -t $issue -n "$title"
end


function dev_issue
  set issue $argv[1]
  gh issue develop $issue -c
  set title (gh issue view $issue --jq .title --json title)
  harvest_cli -t $issue -n "$title"
end
/home/kevin/.local/bin/mise activate fish | source
