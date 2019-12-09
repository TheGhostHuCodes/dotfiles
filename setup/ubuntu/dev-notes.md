The following
[link](https://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment)
describes how to set up vagrant to run with a desktop environment. It works,
but it's really slow. I'm not sure what combination of resources will make it
sufficiently fast, but running VSCode in the VM feels too laggy to be
productive.

Adding the following to the ansible build will set up xfce in the vagrant
machine:

```yaml
    - name: install xfce desktop
      apt:
        update_cache: yes
        cache_valid_time: 3600
        name:
          - xfce4
          - virtualbox-guest-dkms
          - virtualbox-guest-utils
          - virtualbox-guest-x11
      become: True

    - name: allow all users to run X server
      shell: sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
      become: True
```

you'll also need to execute the following commands in the shell:

```shell
VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless
startxfce4&
```
