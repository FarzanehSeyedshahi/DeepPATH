
taskset -c 5-36 python 00_preprocessing/0b_tileLoop_deepzoom6.py  -s 224 -e 0 -j 32 -B 40 -P 1.8 -p -1 -o  /mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_500/tile_outputs_00/2004/ "/mnt/cephfs/home/users/fshahi/sharedscratch/Projects/Datasets/Meso_500/Mesothelioma 2004/**/*.ndpi"
# python 00_preprocessing/0d_SortTiles.py --SourceFolder=/mnt/cephfs/home/users/fshahi/Projects/Datasets/TCGA_MESO/tile_outputs_00/ --Magnification=1.8  --MagDiffAllowed=1 --SortingOption=10 --PercentTest=15 --PercentValid=15
# mpirun -n 4 python3 00_preprocessing/0e_jpgtoHDF.py --input_path tile_outputs_00/ --output /mnt/cephfs/home/users/fshahi/Projects/Datasets/TCGA_MESO/hdf5_TCGA_MESO_test.h5 --chunks 4 --sub_chunks 8 --wSize 224 --mode 2 --subset='test' --mag 1.8
