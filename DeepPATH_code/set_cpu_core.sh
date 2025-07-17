#!/bin/bash

# # Check if CPU core argument is provided
# if [ $# -lt 2 ]; then
#     echo "Usage: ./set_cpu_core.sh <cpu_core> <command>"
#     exit 1
# fi

# cpu_core=$1
# shift

# # Check if the provided CPU core is valid
# lscpu_output=$(lscpu)
# cpu_count=$(echo "$lscpu_output" | awk '/^CPU\(s\)/ { print $2 }')

# if [ "$cpu_core" -ge "$cpu_count" ]; then
#     echo "Invalid CPU core. The system has $cpu_count CPU core(s)."
#     exit 1
# fi

# # Set CPU affinity using taskset
# for cpu_core in [0-9]*; do
#     if [ "$cpu_core" -ge "$cpu_count" ]; then
#         break
#     fi
#     taskset -c $cpu_core $@
# done

 
# taskset -c 225-255 python 00_preprocessing/0b_tileLoop_deepzoom6.py  -s 224 -e 0 -j 32 -B 40 -P 1.8 -p -1 -o  /raid/users/farzaneh/DeepPATH/DeepPATH_code/tile_outputs_00/ "/raid/users/farzaneh/DeepPATH/**/*.ndpi"

until python 00_preprocessing/0b_tileLoop_deepzoom6.py -s 224 -e 0 -j 32 -B 40 -P 1.8 -p -1 -o /home/alsadats@clb.loc/Datasets/tiles/ "/home/alsadats@clb.loc/Dataset/Stage-Meso-IA/*/*.svs"; do
    echo "Process failed, retrying in 10 seconds..."
    sleep 10
done
