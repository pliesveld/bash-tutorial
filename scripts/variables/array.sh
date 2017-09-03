#!/bin/bash

declare -a ARRAY

ARRAY=( cmd --some-arg "some value with a space")

echo "ARRAY contains ${#ARRAY[*]} elements: ${ARRAY[*]}"

ARRAY+=(
    --config
    file.conf
	--auth
)


echo "ARRAY contains ${#ARRAY[*]} elements: ${ARRAY[*]}"

# does not work on Mac bash
ARRAY[-2]="CHANGED.conf"

echo "ARRAY contains ${#ARRAY[*]} elements: ${ARRAY[*]}"

unset ARRAY[3]
unset ARRAY[4]

echo "ARRAY contains ${#ARRAY[*]} elements: ${ARRAY[*]}"

echo -n "indicies: " ;
echo "${!ARRAY[@]}"

declare -a NEW_ARRAY


# ARRAY now has indicies in the middle of the sequence that are undefined.
# Copy the values into a new array:
set -- "${ARRAY[@]}"
INDICIES=( ${!ARRAY[@]} )
(( idx=0 ))
for arg; do
    echo -n "${INDICIES[idx]}: "
    echo "$arg "
	NEW_ARRAY[idx]="$arg"
    (( idx++ ))
done


echo "NEW_ARRAY contains ${#NEW_ARRAY[*]} elements: ${NEW_ARRAY[*]}"


# Display the array indicies and values
set -- "${NEW_ARRAY[@]}"
INDICIES=( ${!NEW_ARRAY[@]} )
(( idx=0 ))
for arg; do
    echo -n "${INDICIES[idx]}: "
    echo "$arg "
    (( idx++ ))
done


# Copy NEW_ARRAY to ARRAY
unset ARRAY
declare -a ARRAY
ARRAY=( "${NEW_ARRAY[@]}" )

# Display the array indicies and values
set -- "${ARRAY[@]}"
INDICIES=( ${!ARRAY[@]} )
(( idx=0 ))
for arg; do
    echo -n "${INDICIES[idx]}: "
    echo "$arg "
    (( idx++ ))
done





