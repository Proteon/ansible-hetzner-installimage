Hetzner Installimage
=========

You can use this role to install custom Linux images on Hetzner Robot dedicated machines.

Features:

* Advanced partitioning
* Disk encryption
* Automated installation of standard or custom Linux images

Requirements
------------

- Ansible 2.7 or newer
- Hetzner service account

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

- `ssh_key_fingerprint`: you can get this fingerprint with something like `echo ${$(ssh-keygen -l -E md5 -f ~/.ssh/id_ed25519 | awk '{ print $2 }')#"MD5:"}`

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT

Author Information
------------------

Written by Alwyn Kik at [Proteon](https://proteon.com/)

