#!/bin/bash -eu

ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime

if ! id "$USER_NAME" &>/dev/null 2>&1; then
  useradd -m -s /bin/bash "$USER_NAME"
  usermod -a -G sudo "$USER_NAME"

  echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

  mkdir -p "/home/$USER_NAME/.ssh"
  echo "$PUBLIC_KEY" > "/home/$USER_NAME/.ssh/authorized_keys"
fi

/usr/sbin/sshd -D
