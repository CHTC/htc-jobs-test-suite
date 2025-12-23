#!/bin/bash

cat << EOF
# Job running on $(hostname) as $(whoami).
# Current directory:
$ ls
$(ls)

EOF

