# for n in {1..58}
# do 
#     mv 'Meso '$n Meso_$n; 
# done

#bin/bash

# taskset -c 5-36 python 00_preprocessing/0b_tileLoop_deepzoom6.py  -s 224 -e 0 -j 32 -B 40 -P 1.8 -p -1 -o  /mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_500/tile_outputs_00/2003/ "/mnt/cephfs/home/users/fshahi/sharedscratch/Projects/Datasets/Meso_500/Mesothelioma 2003/**/*.ndpi"

# python 00_preprocessing/0d_SortTiles.py --SourceFolder=/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_100/tile_outputs_00/ --Magnification=1.8  --MagDiffAllowed=1 --SortingOption=10 --PercentTest=15 --PercentValid=15

# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path /mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_100/sorted --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_100/he/patches_h224_w224/hdf5_Meso_100_he_train.h5 --chunks 4 --sub_chunks 8 --wSize 224 --mode 2 --mag 1.8 --subset='train'


# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path /mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_100/sorted/bioclavis_tiles_112px_extracted/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/hdf5_bioclavis_valid.h5 --chunks 4 --sub_chunks 8 --wSize 112 --mode 2 --subset='valid' --mag 20

# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/bioclavis_tiles_112px_extracted/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/hdf5_bioclavis_train.h5 --chunks 4 --sub_chunks 8 --wSize 112 --mode 2 --subset='train' --mag 20

# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/bioclavis_tiles_112px_extracted/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/hdf5_bioclavis_combined.h5 --chunks 4 --sub_chunks 8 --wSize 112 --mode 2 --subset='combined' --mag 20 (just for  having the record for MIF images)


# python 00_preprocessing/0d_SortTiles.py --SourceFolder=/mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/bioclavis_tiles_112px_extracted/bioclavis_tiles_112px/ --Magnification=20  --MagDiffAllowed=1 --SortingOption=10 --PercentTest=15 --PercentValid=15

# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path /mnt/cephfs/home/users/fshahi/Projects/DeepPATH/DeepPATH_code/bio/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/mif/patches_h112_w112/hdf5_bioclavis_mif_test.h5 --chunks 4 --sub_chunks 8 --wSize 112 --mode 2 --mag 20 --subset='test'

# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path /mnt/cephfs/home/users/fshahi/Projects/DeepPATH/DeepPATH_code/bio/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/mif/patches_h112_w112/hdf5_bioclavis_mif_train.h5 --chunks 4 --sub_chunks 8 --wSize 112 --mode 2 --mag 20 --subset='train'

# mpirun -n 4 python3 0f_npy_to_hdf.py --input_path /mnt/cephfs/home/users/fshahi/sharedscratch/Projects/MIF/datasets/array_tiles_256px/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/mif/patches_h256_w256/hdf5_bioclavis_mif_npy.h5 --chunks 4 --sub_chunks 8 --wSize 256 --mode 0 --mag 20 --subset='combined'


while IFS= read -r line; do
    name_pth=$(echo ${line} | cut -d '/' -f 11-14)
    full_path=$(echo "/mnt/cephfs/home/users/fshahi/data/M42/nas/Nanozoomer active projects/JLQ E1/Mesothelioma/$name_pth")
    cp "$full_path" /mnt/cephfs/home/users/fshahi/Projects/Datasets/large_ndpis/
    echo $full_path
done < /mnt/cephfs/home/users/fshahi/data/FSHAHI/2004/not_tiled_1699076555.8588185.txt