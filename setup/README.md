This part of the repository contains files for bootstrapping a dev machine from
scratch using a small shell script to install `ansible`, and executing
`ansible-playbook` to set up the machine the rest of the way.

Since setup is operating system dependent each supported system has a separate
ansible playbook and `bootstrap_ansible.sh` script stored in a different
directory. The `template/` directory contains system compatible dotfiles that
are deployed to all systems. After cloning this repository, change into the
operating system directory for the system you are setting up and follow the
`README.md` instructions within:

```
.
├── macOS/
├── templates/
└── ubuntu/
```
