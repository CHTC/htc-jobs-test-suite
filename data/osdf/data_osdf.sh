#!/bin/bash

cat << EOF
# Job running on $(hostname) as $(whoami).
# Current directory:
$ ls
$(ls)

# Contents of hello-world.txt:
$ cat hello-world.txt
$(cat hello-world.txt)

EOF

