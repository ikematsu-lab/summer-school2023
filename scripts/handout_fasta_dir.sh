#!/bin/bash


#user="${1}"

while read user; do
  cp -r /opt/notebooks/list /home/${user}/list
  cp /opt/notebooks/essential.fasta /home/${user}/essential.fasta
  chown ${user}: /home/${user}/essential.fasta
  chown -R ${user}: /home/${user}/list
done < /tmp/users.txt
