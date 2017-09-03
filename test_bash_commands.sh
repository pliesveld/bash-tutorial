#!/bin/bash

cat <<EOF
  ############################
  The following bash options represent script execution in strict mode.

  set -Eeuo pipefail

  The options configure bash to do the following:

  -E           

  -e           Abort script at first error, when a command exits with non-zero status (except in until or while loops, if-tests, list constructs)



  -u           Attempt to use undefined variable outputs error message, and forces an exit
  -o pipefail  Causes a pipeline to return the exit status of the last command in the pipe that returned a non-zero return value

  For more information, visit the following: 
    
    http://tldp.org/LDP/abs/html/options.html

    http://redsymbol.net/articles/unofficial-bash-strict-mode/

##########################
EOF

# DEBUG_FLAG="-x"
# DEBUG_SCRIPT=0

touch /tmp/script.sh
chmod +x /tmp/script.sh

BASH_OPTIONS_TEST=( -E -e "-o pipefail" "-eo pipefail")

set -- "${BASH_OPTIONS_TEST[@]}"

for BASH_OPTIONS; do

    cat > /tmp/script.sh <<EOF

set ${BASH_OPTIONS}

trap 'echo ABORTED' EXIT

############################
# Test how bash will execute under the different bash options.
# Uncomment only one line below:
############################

# grep some-string /non/existent/file

# grep some-string /non/existent/file | sort

# true | false

# false | true

# true | true

# false | false

# false ; true

# true && false && true

# true && { false ; true; }





trap 'echo EXECUTION OF SCRIPT CONTINUES' EXIT
EOF

    echo '**************************'
    echo "Testing ${BASH_OPTIONS}:"

    if [[ -n "$DEBUG_SCRIPT" ]]; then
        echo 'Executing script:'
        echo
        cat /tmp/script.sh | grep -v '^#' | grep -v '^$'
        echo '^^^^^^^^^^^^^^^^^^^^^^^^^^'
    fi


    bash $DEBUG_FLAG < /tmp/script.sh
    echo '**************************'

done



