#! /usr/bin/env zsh

# ansible-skel — create a skeleton of file for roles hierarchy

role=${1?Must provide role}
desc=${2?Must provide description}
user=${3-root}

mkdir -p roles/$role/{files,templates,tasks,handlers,vars,meta}

for main in roles/$role/{tasks,vars}/main.yaml; do
  if [[ -e $main ]]; then
    print already exists: $main
  else
    cat << EOF >$main
  # Targets (hosts, user, sudo, sudo_user, gather_facts)
- name: $role — $desc
  user: $user
  #hosts: [...]

  #vars:

  tasks:
  - name: first task

  #handlers:
EOF
  fi
done

print "Creating group_vars/all.yaml"
mkdir group_vars
print "# Global variables for $role" >group_vars/all.yaml

print "Creating site.yaml"
cat << EOF >site.yaml
  # Targets (hosts, user, sudo, sudo_user, gather_facts)
- name: $role — $desc
  user: $user
  #hosts: [...]

  roles:
  - common
  - $role
EOF

print 'Created hierarchy'
tree

print 'Copy files into "files" and "templates", and create a "main.yaml" to activate others.'
