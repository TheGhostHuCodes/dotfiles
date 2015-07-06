#dotfiles

These are my dotfiles for vim, git, and tmux.

##Prerequisites

###Esc

The Esc key on most modern keyboards are ridiculously small. The best way I
have found to solve this problem is to remap the Caps Lock key to be a second
Esc

- In Ubuntu, I use gnome-tweak-tool
```
    sudo apt-get install gnome-tweak-tool
```

- In OSX, I use [Seil](https://pqrs.org/osx/karabiner/seil.html) to set the
  control key to be a second Escape key.
```
    brew cask install seil
```

- In Windows, I use [SharpKeys](https://sharpkeys.codeplex.com/).

###Vim Package Manager
My current package manager of choice is [Vundle](https://github.com/gmarik/Vundle.vim).
