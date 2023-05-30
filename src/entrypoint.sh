#!/bin/bash
echo "Remote Dev-Container"
echo "This Image was build on $(cat /build.time)"

# adding user
adduser \
  --home "/home/$SSH_USER" \
  --shell "/bin/bash" \
  --gecos "$SSH_USER,,," \
  --disabled-password \
  "$SSH_USER"

# allow sudo-less docker execution
usermod -aG docker "$SSH_USER"

# setting password
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

# add sudo permissions
usermod -aG sudo "$SSH_USER"
echo "$SSH_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/docker-admin

# register public key
if [ "$SSH_KEY" != "" ]; then
  echo "Registering public key..."
  mkdir "/home/$SSH_USER/.ssh"
  echo "$SSH_KEY" > "/home/$SSH_USER/.ssh/authorized_keys"
else
  echo "No Public-Key provided. Skipping..."
fi

# run ssh server
echo "Running SSH server..."
/usr/sbin/sshd \
  -D \
  -o ListenAddress=0.0.0.0