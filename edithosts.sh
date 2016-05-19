#!/bin/bash

# Add entry to /etc/hosts file

PATH="/usr/bin:/usr/sbin:/usr/local/bin:/bin:/sbin"

cat /etc/hosts | grep dev-chef-server-ken.shomi.com

if [ $? -eq 0 ]; then
  echo "Hosts file entry already exists"
else
  # Make backup of existing /etc/hosts file
  cp /etc/hosts /etc/hosts.`date +"%Y-%m-%d"`

  echo "Adding entry for Chef server to /etc/hosts"
  echo '52.207.212.236  dev-chef-server-ken.shomi.com' >> /etc/hosts
fi
