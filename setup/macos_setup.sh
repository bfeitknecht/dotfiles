#!/usr/bin/env bash


# refference
# ~/HOME/other/MACOS-SETUP.sh

###########################
# settings, defaults
#
# make dock animation snappy
defaults write com.apple.dock autohide-time-modifier -float 0.15 ; killall Dock
#
# ...



##########################
# shell, terminal
#
# hush login message
touch ~/.hushlogin
#
# give sudo touchid
cd /etc/pam.d
sudo cp sudo_local.template sudo_local
# sed -i '/pam_tid.so/s/^#//' sudo_local
cd


# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# test brew
brew doctor

FORMULAE = "" 
CASKS = ""

# install packages
brew install $FORMULAE
brew install $CASKS




# copy docker completions from github
