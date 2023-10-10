#!/bin/bash

# get script absolute path:
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# instal IJulia
julia $script_dir/install_ijulia.jl
echo "Installed IJulia"

# List available Jupyter kernels
kernels=()
while IFS= read -r line; do
    kernels+=( "$line" )
done < <( jupyter kernelspec list )

nkernels=${#kernels[@]}
imax=$(($nkernels-1))

kernel_names=()
kernel_locations=()
IFS=" "

for (( i=1 ; i<=$imax ; i++)); do
    read -ra split_string <<< "${kernels[i]}"
    kernel_names+=( "${split_string[0]}" )
    kernel_locations+=( "${split_string[1]}" )
done

echo "Available jupyter kernels:"

for (( i=0 ; i<=$((imax - 1)) ; i++));
do
    echo "[$i] ${kernel_names[i]}"
done

# Option to remove Jupyter kernels
echo "Remove some of the installed kernels? [y/n]"
read yn1
if [ $yn1 = "y" ]; then
    echo "Indicate the number of the kernels to be remove (seperated by spaces)"
    read -a toremove
    for j in "${toremove[@]}"; do
        kernel_to_remove=${kernel_names[j]}
        jupyter kernelspec remove $kernel_to_remove
    done
fi

# Option to add IJulia Jupyter kernel
echo "Add aditional IJulia jupyter kernels? [y/n]"
read yn2
if [ $yn2 = "y" ]; then
    echo "Indicate the number of Julia threads for the kernel"
    echo "(To add multiple kernels, indicate the number of threads for each kernel seperated by spaces)"
    read -a toadd
    for nthreads in "${toadd[@]}"; do
        julia $script_dir/install_ijulia_kernel.jl $nthreads
        echo "Added kernel with $nthreads threads"
    done
fi


