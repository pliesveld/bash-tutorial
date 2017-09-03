#!/bin/bash

#set -x

src1="grocery store"
src2="butcher store"
src3="farmers market"
src4=""
src5=

# Strings can be substituted inside double-quotes
dest="My food comes from ${src1}"

# But not single quotes
dest_wrong='My food comes from ${src2}'


# -z will test if the length of the string is ZERO
[ -z "$src4" ] && echo "\$src4 has zero length"

[ -z "$src5" ] && echo "\$src5 has zero length"

[ -z "$src6" ] && echo "\$src6 has zero length"


# -n will test if the length of the string is NONZERO
[ -n "$src2" ] && echo "\$src2 has non-zero length"


# string equality operations
[ "$src1" = "grocery store" ] && echo "\$src1 is equal to \"grocery store\""

[ "$src2" = "grocery store" ] && echo "\$src2 is not equal to \"grocery store\""


# Using the test command
test -z "$src5" && echo "\$src5 has zero length"

test -n "$src2" && echo "\$src2 has non-zero length"


# Number of characters in $src4, $src5, $src6
echo "\$src4 has ${#src4} characters"
echo "\$src5 has ${#src5} characters"
echo "\$src6 has ${#src6} characters"

echo ; echo ; echo

echo "Following are string operations on the variables:" 
echo ; for var in src1 src2 src3 src4 src5 dest; do echo "$var = ${!var}" ; done ; echo

# Substring ${var:offset:length}
echo -n '${dest:3:4} = ' ; echo "${dest:3:4}"

# Single string substitution ${var/Pattern/Replacement}
echo -n '${dest/o/0} = ' ; echo ${dest/o/0}

# Global string substitution ${var//Pattern/Replacement}

echo -n '${dest//o/0} = ' ; echo ${dest//o/0}

# Conditional string substitution

# suffix match ${var/%Pattern/Replacement}
echo -n '${src2/%store/STORE} = ' ; echo "${src2/%store/STORE}"

echo -n '${src2/%*store/STORE} = ' ; echo "${src2/%*store/STORE}"


# prefix match ${var/#Pattern/Replacement}
echo -n '${src2/#farmers?} = ' ; echo "${src2/#farmers?}"

echo -n '${src3/#farmers?} = ' ; echo "${src3/#farmers?}"

echo ; echo

# Match _names_ of declared variables beginning with varprefix ${!varprefix*}, ${!varprefix@} 

echo "${!src*}"

echo

for arg in "${!src@}"; do
    echo "$arg = ${!arg}" 
done


