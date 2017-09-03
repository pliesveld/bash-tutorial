#!/bin/bash
#!/bin/bash -x

# http://tldp.org/LDP/abs/html/bashver2.html#EX78

echo 'eval method'

a=letter_of_alphabet
letter_of_alphabet=z

echo "a = $a"
eval a=\$$a
echo "Now a = $a"

echo 'Indirect variable reference -- new way'

a=letter_of_alphabet
letter_of_alphabet=z

echo "a = $a"           # Direct reference.

echo "Now a = ${!a}"    # Indirect reference.
#  The ${!variable} notation is more intuitive than the old
#+ eval var1=\$$var2




