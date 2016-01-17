#!/bin/sh

# run apt-get update if you haven't in the last 2 hours.
if test `find "/var/lib/apt/periodic/update-success-stamp" -mmin +120`
then
  apt-get update
fi

# Terminal tools.
apt-get install zsh
apt-get install vim
apt-get install tmux
apt-get install tree
apt-get install libgnome2-0 -y

# Desktop usability.
apt-get install chromium-browser
apt-get install gnome-tweak-tool

# Version control.
apt-get install git
apt-get install openssh-server

# For building unison.
apt-get install ocaml liblablgtk2-ocaml-dev
