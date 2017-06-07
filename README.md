andrewrothstein.docker-machine
===========================
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-docker-machine.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-docker-machine)

Installs [docker-machine](https://github.com/docker/machine)

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
    - andrewrothstein.docker-machine
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
