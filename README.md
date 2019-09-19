# Ansible Playground

# Building

A `docker-compose.yml` file is included for ease of building,
and can be utilised with the following command:

```bash
docker-compose build
```

This will give you a few images to play with, tagged as such:

```buildoutcfg
REPOSITORY                             TAG                  IMAGE ID            CREATED             SIZE
ansible-test-host                      centos               95c062a01b54        11 minutes ago      464MB
ansible-test-host                      debian               8befa6af97f8        14 minutes ago      175MB
```

# Spinning up new hosts

The Debian container is capable of being ran without priviledged mode,
while the Centos version mandates privileged mode at the moment.

```bash
# debian
docker run -d --name debtest -p 1337:22 ansible-test-host:debian

# centos
docker run -d --privileged --name centtest -p 1337:22 ansible-test-host:centos
```

These can now be connected to locally on your chosen port (1337 as above)
```bash
ssh root@localhost -p 1337
``` 

Please bear in mind as per the example above, if you connect on the same port to localhost
repeatedly then you will encounter issues with SSH's strict host checking.

This can be fixed by editing your `~/.ssh/known_hosts` file,
or disabling strict host checking for the purposes of testing.