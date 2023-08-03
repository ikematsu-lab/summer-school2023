#!/bin/bash


#user="${1}"

while read user; do
  cp /opt/notebooks/sequences.fasta /home/${user}/
  chown ${user}: /home/${user}/sequences.fasta
done < /tmp/users.txt
