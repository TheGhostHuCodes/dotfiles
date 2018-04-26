macOS installation requires a few manual steps listed below:

- [Remap caps lock key to escape
  key](https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x)
- [Change default commandline to
  zsh](https://apple.stackexchange.com/questions/88278/change-default-shell-from-bash-to-zsh)

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
ansible-playbook ubuntu.yml
```

When using the ansible homebrew module, the following packages will need your
password for installation:

- java
- vagrant
- virtualbox

ansible will pause indefinitely until a password is supplied.
