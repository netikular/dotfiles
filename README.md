kevin's dotfiles
===================

Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/netikular/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

You can safely run `rcup` multiple times to update:

    rcup

VIM
-------

After you have run the rcup command you will need to build Command-T

    cd $HOME/.vim/bundle/Command-T/ruby/command-t
    rvm use system # if you are using rvm
    ruby extconf.rb
    make

That should do it for you, you now have lightning fast file completion

Memo
----
A note taking app that lives on the command line.
http://www.getmemo.org/

Credits
-------

Thank you, to thoghtbot for the inspiration and tools needed to easily 
manage ones own dotfiles repository.

These dotfiles are maintained and used by Kevin Pratt
