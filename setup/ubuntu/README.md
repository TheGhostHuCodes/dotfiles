To test these scripts, ensure that vagrant is installed and execute the
following commands:

```shell
vagrant up
vagrant ssh
cd ansible-dotfiles/ubuntu/
sudo ./bootstrap_ansible.sh
ansible-playbook ubuntu.yml
```

To clean up the VM after testing, exit from the VM and execute:

```shell
vagrant destroy
```

For both testing and actual deployment, ansible expects a yaml file named
`user_vars.yml` with the following content:

```yaml
git_personal_name: <name>
git_personal_email: <email>
git_work_name: <name>
git_work_email: <email>
```

these variables are used when templating some files.
