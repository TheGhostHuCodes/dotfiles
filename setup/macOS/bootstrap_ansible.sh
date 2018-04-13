#!/usr/bin/env bash

if command -v brew > /dev/null 2>&1
then
	echo "Brew is already installed!"
else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install ansible
