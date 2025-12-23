#!/bin/bash

python3 pytorch.py > exec_pytorch.out
exec_pytorch_exitcode=$?

cat << EOF
# Job running on $(hostname) as $(whoami).

# OS version (should match container):
$ ./version.sh
$(./version.sh)

# Use PyTorch to check GPU functionality
$ cat exec_pytorch.out
$(cat exec_pytorch.out)
$ echo \$exec_pytorch_exitcode
$(echo $exec_pytorch_exitcode)

EOF

rm -f exec_*.out

