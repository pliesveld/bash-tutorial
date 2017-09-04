#!/bin/bash

#set -x

echo 'OIFS=$IFS; IFS=:' ; echo

OIFS=$IFS # save previous IFS value
IFS=: # /etc/passwd uses ":" for field separator

echo 'declare -a ARRAY'
echo 'readarray -c 7 ARRAY < data/passwd' ; echo
declare -a ARRAY
readarray -n 3 -c 7 ARRAY < data/passwd

echo -n '${ARRAY[@]} = ' ; echo "${ARRAY[@]}" ; echo

# The Internal Field Separator is also used on output
echo -n '${ARRAY[*]} = ' ; echo "${ARRAY[*]}" ; echo

# set the Internal Field Separator variable to the original value
IFS=$OIFS 
echo 'IFS=$OIFS' ; echo

# note: the deliminator : is no longer present in the output
echo -n '${ARRAY[*]} = ' ; echo "${ARRAY[*]}"


echo '$ ps -o pid,ppid,pgid,comm' ; echo
ps -o pid,ppid,pgid,comm

# When using a pipeline, bash runs commands in subshells.  Therefore, the array is populated in a subshell, so the parent shell has no access to it
ps -o pid,ppid,pgid,comm | readarray -t -s 1 PROCS 
echo "${PROCS[*]}"

echo 

# When using a pipeline, bash runs commands in subshells.  Therefore, the array is populated in a subshell, so the parent shell has no access to it
readarray -t -s 1 PROCS < <(ps -o pid:1,ppid:1,pgid:1,comm:1)

echo "There are ${#PROCS[@]} processes running. The first line from the output of the ps command is: ${PROCS[0]}"

echo ; echo

