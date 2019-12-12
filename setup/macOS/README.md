# Brand New macOS Installation

1. Make a backup of the data from your previous machine. Here's a list of
commonly forgotten things:

  - Everything on your `~/Desktop/` and `~/Downloads/` folders.
  - ssh-keys under `~/.ssh/`
  - aws related credentials under `~/.aws/`

1. [Remap Caps Lock key to Escape
key](https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x).

1. Open up Safari, go to https://github.com/TheGhostHuCodes/dotfiles, and
   download a copy of the dotfiles directory to your local folder. From there
   execute the `/dotfiles/setup/macOS/bootstrap_ansible.sh` script.

   ```console
   $ ./bootstrap_ansible.sh
   ```

   This script installs the Xcode prerequisites for macOS, ansible, and git.
   Once the ansible related prerequisites are installed, go ahead and delete
   the repository download.

1. Open a terminal and `mkdir ~/repos && cd ~/repos`

1. `git clone https://github.com/TheGhostHuCodes/dotfiles.git`

1. Use this cloned directory to actually set up the machine using ansible.
   Ansible expects a yaml file named `user_vars.yml` with the following
   content:

   ```yaml
   git_personal_name: <name>
   git_personal_email: <email>
   git_work_name: <name>
   git_work_email: <email>
   ```

   these variables are used when templating some files.

   ```console
   $ ansible-playbook --ask-become-pass macos.yml
   ```

   When using the ansible homebrew module, some packages require you to input your
   password for installation. Doing this once caches the password for the rest of
   the installation. Ansible will pause indefinitely until a password is supplied.

   The following cask packages seem to require a password:

   - vagrant

   In addition to this, some packages require approval in the `Security & Privacy`
   section of `System Preferences` during installation. This will cause ansible to
   fail at that step, and you will need to execute the playbook again.

   The following cask packages seem to cause this problem:

   - virtualbox

   Vundle packages for vim and minpac packages for nvim need to be installed
   separately the first time those editors are started.

1. Do all the other manual setup steps:

  - [Change default commandline to
    fish](https://apple.stackexchange.com/questions/88278/change-default-shell-from-bash-to-zsh).
    The stackexchange question is about switching to zsh, but it works just as
    well for fish.
  - [Install
    Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704).
  - [Turn off iterm2
    bell](https://www.quora.com/How-does-one-stop-the-sound-from-iTerm2-in-macOS).
