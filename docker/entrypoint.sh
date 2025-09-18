#!/bin/bash
set -e

# Start the SSH server in the background
/usr/sbin/sshd

# Execute the main command (passed from the Dockerfile's CMD)
exec "$@"