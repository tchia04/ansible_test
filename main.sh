#!/bin/sh

#set -ex 
echo "Checking syntax on all ansible playbooks... "
./check_ansible_playbook_syntax.sh
status=$?
if [ $? -eq 0 ]; then
    echo Playbook syntax is OK
else
    echo Playbook syntax FAIL
    exit 1
fi

echo "Running ping_playbook.yml"
ansible-playbook ./ping_playbook.yml -i "localhost," -c local
if [ $? -eq 0 ]; then
    echo Playbook execution is OK
else
    echo Playbook execution FAIL
    exit 1
fi
