# My Fish Config
if status --is-interactive
  if test (uname) = "Darwin"
    ssh-add -q --apple-load-keychain
  else
    ssh-add -q
  end

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
  complete -c p -a (cat $HOME"/.project_list") -x

  ulimit -n 4096

  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

  set -x CFLAGS "-O2 -g -fno-stack-check"
  set -x KERL_CONFIGURE_OPTIONS "--disable-hipe --without-javac --with-ssl=/usr/local/opt/openssl@1.1"
  set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=/usr/local/opt/openssl@1.1"

# The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/kevin/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/kevin/Downloads/google-cloud-sdk/path.fish.inc'; end

  if test -e $HOME"/.asdf/asdf.fish"
    source ~/.asdf/asdf.fish
  end

  if test -e $HOME"/.config.local.fish"
    source $HOME"/.config.local.fish"
  end

  eval (direnv hook fish)
end

# Variables
set -x EDITOR nvim
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
set -x PATH $HOME/local/nvim/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/go/bin $PATH
# set -x PATH $HOME/.cargo/bin $PATH
set -x MANPATH $MANPATH /usr/local/opt/erlang/lib/erlang/man
set -x TERM screen-256color


