#!/bin/bash

nvidia-smi > exec_nvidia_smi.out
exec_nvidia_smi_exitcode=$?

cuda_lib=$(ldconfig -p | grep "/cuda/" | cut -d '>' -f 2 | head -n 1 | sed -e 's;/targets/.*$;;g')
cuda_deviceQuery=$(find -L $cuda_lib -name 'deviceQuery' | head -n 1)

$cuda_deviceQuery > exec_cuda_deviceQuery.out
exec_deviceQuery_exitcode=$?

cat << EOF
# Job running on $(hostname) as $(whoami).

# Check for GPU:
$ cat exec_nvidia_smi.out
$(cat exec_nvidia_smi.out)
$ echo \$exec_nvidia_smi_exitcode
$(echo $exec_nvidia_smi_exitcode)

# CUDA library location
$ echo \$cuda_lib
$(echo $cuda_lib)

# CUDA deviceQuery location:
$ echo \$cuda_deviceQuery
$(echo $cuda_deviceQuery)

# CUDA test:
$ cat exec_cuda_deviceQuery.out
$(cat exec_cuda_deviceQuery.out)
$ echo \$exec_deviceQuery_exitcode
$(echo $exec_deviceQuery_exitcode)

EOF

rm -f exec_*.out

