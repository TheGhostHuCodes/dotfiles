#!/bin/sh

# run apt-get update if you haven't in the last 2 hours.
if test `find "/var/lib/apt/periodic/update-success-stamp" -mmin +120`
then
  apt-get update
fi

# Terminal tools.
apt-get --yes install zsh
apt-get --yes install vim-gnome-py2
apt-get --yes install tmux
apt-get --yes install tree
apt-get --yes install libgnome2-0
apt-get --yes install whois
apt-get --yes install silversearcher-ag

# Desktop usability.
apt-get --yes install chromium-browser
apt-get --yes install gnome-tweak-tool
apt-get --yes install steam

# Version control.
apt-get --yes install git
apt-get --yes install openssh-server

# For building unison.
apt-get --yes install ocaml liblablgtk2-ocaml-dev
