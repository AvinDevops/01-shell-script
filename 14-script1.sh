#!/bin/bash

COURSE="Devops from script-1"

echo "script-1 value, course : $COURSE "
echo "Process ID of script-1 : $$"

./15-script2.sh

echo "After calling script-2 : $COURSE "
echo "Process ID of script-2 : $$ "
