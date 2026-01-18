#!/bin/bash -eu

INIT_FILE="/usr/local/scripts/init.sh"

if [-f "$INIT_FILE"]; then
  exec "$INIT_FILE"
  rm "$INIT_FILE"
fi

/usr/sbin/sshd -D
