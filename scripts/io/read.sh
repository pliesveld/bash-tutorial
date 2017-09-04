#!/bin/bash

#set -x

#bash can load the contents of files on the filesystem:
echo 'read firstline < data/passwd'
read firstline < data/passwd
echo "\$firstline = $firstline"
echo

# Subsequent reads start from the begging
echo 'read firstline < data/passwd'
read firstline < data/passwd
echo "\$firstline = $firstline"

echo

echo 'read first second < data/passwd'
read first second < data/passwd
echo "\$first = $first"
echo "\$second = $second"

echo 

# Lines are split using the IFS (Internal Field Separator variable).
# Try removing one of the _ in the read statement below:

echo 'OIFS=$IFS; IFS=:' ; echo

OIFS=$IFS # save previous IFS value
IFS=: # /etc/passwd uses ":" for field separator

echo 'read user _ _ _ _ home shell remaining < data/passwd'
read user _ _ _ _ home remaining < data/passwd
echo "\$user = $user"
echo "\$home = $home"
echo "\$shell = $shell"
echo "\$remaining = $remaining"

# read in a loop
while read user _ _ _ _ home remaining; do
echo -n "$user has the home directory $home "
done < data/passwd

echo 'IFS=$OIFS' ; echo
IFS=$OIFS # set the Internal Field Separator variable to the original value

echo

#### inplace file redirection
while read line; do
    echo $line
done <<EOF
This is an inplace file.
The text between <<EOF and \\\nEOF will
be treated as the contents of the file.
It can contain environment variables, such as $firstline
EOF

echo ; echo ; echo

echo 'find . -type f -name '*.sh' -printf "%f\n" | while read file do . . .' 

find . -type f -name '*.sh' -printf "%f\n" | while read file; do echo -n "$file "; done

echo ; echo ; echo


