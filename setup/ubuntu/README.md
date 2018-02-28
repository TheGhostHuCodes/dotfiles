This part of the repository contains files for bootstrapping an ubuntu machine
from scratch using a small shell script to install ansible, and an ansible
playbook to set up the machine the rest of the way.

To test these scripts, install vagrant and execute the following commands:

```shell
vagrant up
vagrant ssh
cd ansible-dotfiles
sudo ./bootstrap_ansible.sh
ansible-playbook ubuntu.yml
```

Ansible expects a yaml file named `user_vars.yml` with the following content:

```yaml
git_personal_name: <name>
git_personal_email: <email>
git_work_name: <name>
git_work_email: <email>
```

these variables are used when templating some files.
