# My Fish Config
if status --is-interactive
  if test (uname) = "Darwin"
    ssh-add -q -A
  else
    ssh-add -q
  end
end

set -x EDITOR nvim

# Variables
set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
# set -x PATH $HOME/.asdf/shims $PATH
set -x PATH $HOME/local/nvim/bin $PATH
# set -x PATH $HOME/.bin $PATH
# set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/bin $PATH

set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/go/bin $PATH
# set -x PATH $HOME/.fastlane/bin $PATH
# set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools/
# set -x PATH $PATH (python3 -c 'import site; print(site.USER_BASE)')"/bin"
# set -x ANDROID_HOME $HOME/Library/Android/sdk/
# set -x JAVA_HOME "/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
set -x MANPATH $MANPATH /usr/local/opt/erlang/lib/erlang/man

set -x TERM screen-256color

if test -e $HOME"/.config.local.fish"
  source $HOME"/.config.local.fish"
end

if set -q NVIM_LISTEN_ADDRESS
  set -x VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  set -x VISUAL "nvim"
end

# rbenv integration
# set -x RBENV_ROOT /usr/local/var/rbenv
# status --is-interactive; and source (rbenv init -|psub)

set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set ___fish_git_prompt_color_branch (set_color yellow)
set ___fish_git_prompt_color_branch_done (set_color f3e)


# Set up completions
complete -c g -w git
complete -c gpo -w git
complete -c e -w emacs
# complete -c ossh_prod -a (cat $HOME"/.oss_prod_hosts") -x
# complete -c ossh_stage -a (cat $HOME"/.oss_stage_hosts") -x
complete -c p -a (cat $HOME"/.project_list") -x


# function cache_lists
#   oss_hosts $OSS_STAGE_PWD builder $OSS_STAGE_HOST > $HOME/.oss_stage_hosts
#   oss_hosts $OSS_PROD_PWD builder $OSS_PROD_HOST > $HOME/.oss_prod_hosts
#   p list > $HOME/.project_list
# end

ulimit -n 4096

# OPAM configuration
# . /Users/kevin/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
# eval (opam config env)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
source ~/.asdf/asdf.fish

set -x CFLAGS "-O2 -g -fno-stack-check"
set -x KERL_CONFIGURE_OPTIONS "--disable-hipe --without-javac --with-ssl=/usr/local/opt/openssl@1.1"
set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=/usr/local/opt/openssl@1.1"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/kevin/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/kevin/Downloads/google-cloud-sdk/path.fish.inc'; end

# source /Users/kevin/Projects/OfficeSpace/google-cloud-sdk/path.fish.inc
eval (direnv hook fish)

