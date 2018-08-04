macOS installation requires a few manual steps listed below:

- [Remap caps lock key to escape
  key](https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x)
- [Change default commandline to
  zsh](https://apple.stackexchange.com/questions/88278/change-default-shell-from-bash-to-zsh)
- [Turn off iterm2
  bell](https://www.quora.com/How-does-one-stop-the-sound-from-iTerm2-in-macOS)
- [Install Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704)

Ansible expects a yaml file named `user_vars.yml` with the following content:

```yaml
git_personal_name: <name>
git_personal_email: <email>
git_work_name: <name>
git_work_email: <email>
```

these variables are used when templating some files.

To execute the ansible playbook on a new macOS system:

```shell
./bootstrap_ansible.sh
ansible-playbook macos.yml
```

When using the ansible homebrew module, some packages require you to input your
password for installation. Doing this once caches the password for the rest of
the installation. Ansible will pause indefinitely until a password is supplied.

The following cask packages seem to require a password:

- java
- vagrant

In addition to this, some packages require approval in the `Security & Privacy`
section of `System Preferences` during installation. This will cause ansible to
fail at that step, and you will need to execute the playbook again.

The following cask packages seem to cause this problem:

- virtualbox

Vundle packages for vi need to be installed separately the first time vi is
started.
