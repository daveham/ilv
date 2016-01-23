#!/usr/bin/env bash

# create ssh-config file
ssh_config="$PWD/.vagrant/ssh-config"
vagrant ssh-config > "$ssh_config"

# common roots
root_host="$PWD/.."
root_vm="ssh://default//il/"

# create unison profile for project1
profile1="
root = $root_host
root = $root_vm
path = ilgmrdx
path = ilgmdata
ignore = Name {CHANGELOG.md,CONTRIBUTING.md,LICENSE,README.md,*.log}
ignore = Name {.git,node_modules,DS_Store}
ignore = Path {*/stats,*/thumbs,*/tiles}
prefer = $root_host
repeat = 2
terse = true
dontchmod = true
perms = 0
sshargs = -F $ssh_config
"

# create unison profile for project2
profile2="
root = $root_host
root = $root_vm
path = ilgmsvc
ignore = Name {README.md,*.log}
ignore = Name {.git,node_modules,.DS_Store}
prefer = $root_host
repeat = 2
terse = true
dontchmod = true
perms = 0
sshargs = -F $ssh_config
"

profileAll="
root = $root_host
root = $root_vm
path = ilgmrdx
path = ilgmsvc
ignore = Name {CHANGELOG.md,CONTRIBUTING.md,LICENSE,README.md,*.log}
ignore = Name {.git,node_modules,DS_Store}
prefer = $root_host
repeat = 2
terse = true
dontchmod = true
perms = 0
sshargs = -F $ssh_config
"

# write profiles

if [ -z ${USERPROFILE+x} ]; then
  UNISONDIR=$HOME
else
  UNISONDIR=$USERPROFILE
fi

cd $UNISONDIR
[ -d .unison ] || mkdir .unison
echo "$profile1" > .unison/ilgm.prf
echo "$profile2" > .unison/ilgmsvc.prf
echo "$profileAll" > .unison/ilgmall.prf
