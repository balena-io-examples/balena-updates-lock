#!/bin/bash

# Makes sure we exit if flock fails.
set -e

# The application you'd like to run
main () {
  while : ; do
    echo "Idling & locked: ${COUNTER}"
    sleep 600
  done
}

# Update locking and running the code
(

  flock -x -n 200
  main

) 200>/tmp/balena/updates.lock
