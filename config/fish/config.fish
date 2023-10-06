# My Fish Config
if status --is-interactive
  eval "$(/opt/homebrew/bin/brew shellenv)"

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
  set -x KERL_CONFIGURE_OPTIONS "--disable-hipe --without-javac --with-ssl=/opt/homebrew/opt/openssl@1.1"
  set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@3"
  set -x PKG_CONFIG_PATH "/opt/homebrew/opt/libpq/lib/pkgconfig"

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
set -x PATH $HOME/local/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH /opt/homebrew/opt/postgresql@15/bin $PATH
set -x MANPATH $MANPATH /usr/local/opt/erlang/lib/erlang/man
set -x TERM screen-256color
set -x HOMEBREW_NO_AUTO_UPDATE false

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
