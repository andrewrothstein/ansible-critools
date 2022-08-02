andrewrothstein.critools
=========

![Build Status](https://github.com/andrewrothstein/ansible-critools/actions/workflows/build.yml/badge.svg)

Installs [cri-tools](https://github.com/kubernetes-sigs/cri-tools).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.critools
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
