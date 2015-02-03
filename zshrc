# makes color constants available
autoload -U colors
colors

#Enable less colors
export LESS=-FXR

# enable colored output from ls, etc
export CLICOLOR=1

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[magenta]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

export VISUAL=vim
export EDITOR=$VISUAL

# RVM configuration
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add paths that should have been there by default
# putting /usr/local/bin first so that brew overrides system
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/bin/packer.io"

# mkdir .git/safe in the root of repositories you trust
#export PATH=".git/safe/../../bin:$PATH"

#home brew github api key
export HOMEBREW_GITHUB_API_TOKEN=afbc42fd3b10bca29150c79b59a0b695bda26050

#Vagrant
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"


#My aliases
#Projects
alias poj="cd ~/Projects/OfficeSpace/java_officespace"
alias ppm="cd ~/Projects/vagrant"
alias pdr="cd ~/Projects/iabri/drum" 
alias pdar="cd ~/Projects/iabri/drum_admin"
alias prope="cd ~/Projects/iabri/rope"
alias poh="cd ~/Projects/OfficeSpace/huddle"
alias pfk="cd ~/Projects/forekast/kiwi"
alias pob="cd ~/Projects/EGM/blinc"
alias pok="cd ~/Projects/OfficeSpace/kit"
alias pot="cd ~/Projects/OfficeSpace/task_manager"
alias pef="cd ~/Projects/paradem/edesio/edesio-foundation"
alias pph="cd ~/Projects/paradem/paradem-home"
alias pp="cd ~/Projects/paradem/"

#Add Keys
#ssh-add ~/.ssh/cloverengine.pem
ssh-add ~/.ssh/id_rsa


#Rubocop
alias rubo_all='rubocop -R -D .'
alias rubox_all='rubocop -a -R -D .'
alias rubo="git status --porcelain | egrep '((rb)|(rake))' | awk '{print \$2}' | xargs rubocop -R -D"
alias rubox="git status --porcelain | egrep '((rb)|(rake))' | awk '{print \$2}' | xargs rubocop -a -R -D"



#newline helpers
alias fixnl="sed -i '' -e '\$a\' "

#Vagrant
alias vs="vagrant ssh"
alias vd="vagrant destroy"
alias vu="vagrant up"
alias vp="vagrant provision"

#Helpful aliases
alias e="$EDITOR"
alias v="$VISUAL"
alias l='ls'
alias ll='ls -al'
alias ctags='/usr/local/bin/ctags'
alias b='bundle'
alias rk='.git/safe/../../bin/rake'
alias s='.git/safe/../../bin/rspec'
alias r='.git/safe/../../bin/rails'
alias fack='file ./ | ag '

#Todo aliases
alias m=memo
alias ma="memo -a"

#nvim? is it good?
#alias vim=nvim

#Helpful startup stuff
alias postgres.start="postgres -D /usr/local/var/postgres >logfile 2>&1 </dev/null &"

# history settings
setopt hist_ignore_all_dups inc_append_history
export HISTIGNORE="export TEAMOCIL=*"
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
