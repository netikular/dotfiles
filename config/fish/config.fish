if status --is-interactive
  ssh-add ~/.ssh/id_rsa
end

# Variables
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
set -x PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/bin $PATH

if test -e $HOME"/.config.local.fish"
  source $HOME"/.config.local.fish"
end

# rbenv integration
set -gx RBENV_ROOT /usr/local/var/rbenv
set -gx EDITOR "emacsclient -nw -a emacs_nw"
status --is-interactive; and . (rbenv init -|psub)

set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set ___fish_git_prompt_color_branch (set_color yellow)
set ___fish_git_prompt_color_branch_done (set_color f3e)


# Set up completions
complete -c g -w git
complete -c e -w emacs
complete -c ossh_prod -a (cat $HOME"/.oss_prod_hosts") -x
complete -c ossh_stage -a (cat $HOME"/.oss_stage_hosts") -x
complete -c p -a (cat $HOME"/.project_list") -x


function cache_lists
  oss_hosts $OSS_STAGE_PWD builder $OSS_STAGE_HOST > $HOME/.oss_stage_hosts
  oss_hosts $OSS_PROD_PWD builder $OSS_PROD_HOST > $HOME/.oss_prod_hosts
  p list > $HOME/.project_list
end

status --is-interactive; and . (rbenv init -|psub)
ulimit -n 4096

# OPAM configuration
# . /Users/kevin/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
