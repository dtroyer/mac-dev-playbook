#!/bin/bash
# ruby.sh

# rvm
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
#echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
#source ~/.bash_profile
type rvm | head -1
rvm -v

# rbenv
brew install rbenv
rbenv init
# update .bash_profile so rbenv is always active
echo '# https://github.com/rbenv/rbenv' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# Gems
gem install bundler rake rubocop

# Chef
gem install chef chef-dk berkshelf chef-zero kitchen kitchen-vagrant chefspec foodcritic


# 
vm install 2.6.3
rvm use --default 2.6.3
