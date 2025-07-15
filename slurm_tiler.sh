#!/bin/bash --login
#
#SBATCH --job-name=he_tiler
#SBATCH --mail-user=f.seyedshahi.1@research.gla.ac.uk
#SBATCH --output=/mnt/cephfs/home/users/fshahi/Projects/slurm_logs/tiler_%j.out
#SBATCH --error=/mnt/cephfs/home/users/fshahi/Projects/slurm_logs/tiler_%j.err
#SBATCH --mail-type=FAIL,END
#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --array=1-1495%10                  
#SBATCH --time=24:00:00
#SBATCH --mem=100G
#SBATCH --partition=compute-low-priority

source ~/.bashrc
source "/mnt/cephfs/home/users/fshahi/miniconda3/etc/profile.d/conda.sh"
conda activate tiatoolbox

# source_dir=/mnt/cephfs/home/users/fshahi/Projects/Datasets/MESO_MIF/DM-001-22/
# tiled_dir=/mnt/cephfs/home/users/fshahi/Projects/Datasets/MESO_MIF/DM-001-22/tiled/

source_dir=/nfs/home/users/fshahi/Projects/Datasets/Meso_TMA/block2/tif/
tiled_dir=/nfs/home/users/fshahi/Projects/Datasets/Meso_TMA/block2/tiled/

mkdir -p $tiled_dir
cd "$source_dir" || exit

#FILENAMES contains a list of data files - we select the correct one for the loop counter
image=`tail '+'$SLURM_ARRAY_TASK_ID /nfs/home/users/fshahi/Projects/Datasets/Meso_TMA/block2/tif/file_names.txt | head -1`

echo $image

python3 /mnt/cephfs/home/users/fshahi/Projects/DeepPATH/tiler.py --input $image --output $tiled_dir --tile_size 224 --pixel_size 1.8 --magnification 5.0

date
exit 0
