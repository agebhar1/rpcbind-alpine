#!/bin/bash

# Make sure we react to these signals by running stop() when we see them - for clean shutdown
# And then exiting
trap "stop; exit 0;" SIGTERM SIGINT

stop()
{
  # We're here because we've seen SIGTERM, likely via a Docker stop command or similar
  # Let's shutdown cleanly
  echo "SIGTERM caught, terminating process(es)..."
  # For IPv6 bug:
  pid=`pidof rpcbind`
  kill -TERM $pid > /dev/null 2>&1
  echo "Terminated."
  exit
}

# Partially set 'unofficial Bash Strict Mode' as described here: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -uo pipefail

echo "Starting rpcbind..."
/sbin/rpcbind -w
echo "Displaying rpcbind status..."
/sbin/rpcinfo
echo "Startup successful."

while true; do

  # give the CPU a rest
  sleep 1

done

sleep 1
exit 1
