#!/bin/bash


#user="${1}"

while read user; do
  pw="summer2023"
  useradd -m $user

  echo "${user}:${pw}" | chpasswd
  mkdir -p -m 777 /home/${user}/notebook
  chown ${user}: /home/${user}/notebook
  echo "screenfetch" >> /home/${user}/.bashrc
done < /tmp/users.txt
