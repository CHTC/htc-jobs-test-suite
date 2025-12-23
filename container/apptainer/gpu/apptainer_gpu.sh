#!/bin/bash

# The test used in simple_gpu.sh won't work inside an Apptainer container :(

python3 apptainer_gpu.py > exec_pytorch.out
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

