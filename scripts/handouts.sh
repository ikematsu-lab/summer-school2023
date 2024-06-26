#!/bin/bash


#user="${1}"

while read user; do
  cp /opt/notebooks/sequences.fasta /home/${user}/notebook/
  chown ${user}: /home/${user}/notebook/sequences.fasta
done < /tmp/users.txt
