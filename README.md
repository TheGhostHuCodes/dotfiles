#dotfiles

These are my dotfiles for vim, git, and tmux.

##Prerequisites

###The Escape Key

The Escape key on most modern keyboards are ridiculously small. The best way I
have found to solve this problem is to remap the Caps Lock key to be a second
Escape key, or to switch the Caps Lock key with the Escape key.

- In OSX, I use [Seil](https://pqrs.org/osx/karabiner/seil.html) to set the
  control key to be a second Escape key.
```
brew cask install seil
```

- After updating macOS to Sierra, Seil no longer works. The updated version of
  the tool seems to be called
  [Karabiner-Elements](https://github.com/tekezo/Karabiner-Elements).
```
brew cask install karabiner-elements
```

- In Xubuntu, I create the file `~/.Xmodmap` with the contents:
```
! Swap Caps Lock and Escape keys
remove Lock = Caps_Lock
keysym Escape = Caps_Lock
keysym Caps_Lock = Escape
add Lock = Caps_Lock
```
then I run the command `xmodmap ~/.Xmodmap` to exchange the Caps Lock Key with
the Escape key.

- In Windows, I use [SharpKeys](https://sharpkeys.codeplex.com/).

- In Ubuntu, I use gnome-tweak-tool
```
sudo apt-get install gnome-tweak-tool
```

###Vim Package Manager
My current package manager of choice is [Vundle](https://github.com/gmarik/Vundle.vim).
