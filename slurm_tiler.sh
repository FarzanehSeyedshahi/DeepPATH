#!/bin/bash --login
#
#SBATCH --job-name=large_ndpi
#SBATCH --mail-user=f.seyedshahi.1@research.gla.ac.uk
#SBATCH --output=/mnt/cephfs/home/users/fshahi/sharedscratch/log-files/231102_largeNDPI_%A.out
#SBATCH --mail-type=FAIL,END
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --array=2-1564%10                  
#SBATCH --time=2:00:00
#SBATCH --mem-per-cpu=25G
#SBATCH --partition=compute-low-priority

source ~/.bashrc
source "/mnt/cephfs/home/users/fshahi/miniconda3/etc/profile.d/conda.sh"
conda activate tiatoolbox

# source_dir=~/sharedscratch/datasets/LATTICeA/ndpi
# tiled_dir=~/localscratch/new_tiles_5

# mkdir -p ~/localscratch/new_tiles_5

# cd "$source_dir" || exit

#FILENAMES contains a list of data files - we select the correct one for the loop counter
# image=`tail '+'$SLURM_ARRAY_TASK_ID /mnt/cephfs/home/users/krakovic/sharedscratch/notebooks/to_retile | head -1`
echo $image

python3 /mnt/cephfs/home/users/fshahi/Projects/DeepPATH/tiler.py --input /mnt/cephfs/home/users/fshahi/Projects/Datasets/large_ndpis/ --output /mnt/cephfs/home/users/fshahi/sharedscratch/Projects/DeepPATH/ --tile_size 224 --pixel_size 1.8

date
exit 0