#!/bin/bash

echo "All variables : $@"
echo "Number of variables: $#"
echo "current working directory: $PWD"
echo "who is the user: $USER"
echo "Hostname: $HOSTNAME"
echo "current script name: $0"
echo "Home directory: $HOME"
echo "process ID of this script: $$"
sleep 60 &
echo "process ID of the last background command: $!"