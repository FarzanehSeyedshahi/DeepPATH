#!/bin/bash --login
#
#SBATCH --job-name=subtype_data_preparation
#SBATCH --output=/mnt/cephfs/home/users/fshahi/sharedscratch/Projects/DeepPATH/log-files/231122_bioclavis_data_%A.out
#SBATCH --error=/mnt/cephfs/home/users/fshahi/sharedscratch/Projects/DeepPATH/log-files/231122_bioclavis_data_%A.err
#SBATCH --nodes=2
#SBATCH --cpus-per-task=10
#SBATCH --time=72:00:00
#SBATCH --mem-per-cpu=30G
#SBATCH --partition=compute-low-priority

export TZ=Europe/London
date
hostname

source ~/.bashrc
source "/mnt/cephfs/home/users/fshahi/miniconda3/etc/profile.d/conda.sh"
# conda info --envs
conda activate h5

mpirun -n 1 python3 00_preprocessing/0f_npy_to_hdf.py --input_path /mnt/cephfs/home/users/krakovic/sharedscratch/datasets/bioclavis/array_tiles_256px_sorted/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/mif/patches_h256_w256/hdf5_bioclavis_mif_npy.h5 --chunks 1 --sub_chunks 1024 --wSize 256 --mode 2 --mag 20 --subset='combined'


date
exit 0