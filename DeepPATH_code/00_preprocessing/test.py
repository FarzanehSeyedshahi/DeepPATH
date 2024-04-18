
# import json
# import openslide
# from openslide import open_slide, ImageSlide
# from openslide.deepzoom import DeepZoomGenerator

# slidepath = "../../Meso_1/40x/MESO_1_13.ndpi"

# slide = open_slide(slidepath)
# print(slide.properties[openslide.PROPERTY_NAME_OBJECTIVE_POWER])
# mpp_x = float(slide.properties['openslide.mpp-x'])
# mpp_y = float(slide.properties['openslide.mpp-y'])
# print('mpp_x: ', mpp_x, 'mpp_y: ', mpp_y)

# ndpi_file = openslide.OpenSlide(slidepath)
# width, height = ndpi_file.dimensions
# print('width: ', width, 'height: ', height)
# num_levels = ndpi_file.level_count
# print('num_levels: ', num_levels)
# for level_index in range(num_levels):
#     level_width, level_height = ndpi_file.level_dimensions[level_index]
#     print('level_number', level_index, 'level_width: ', level_width, 'level_height: ', level_height)
#     level_downsamples = ndpi_file.level_downsamples[level_index]
#     print('level_downsamples: ', level_downsamples)
#     # level = ndpi_file[level_index]
#     # print('level information: ', level.dimensions, type(level))
# metadata = ndpi_file.properties
# magnification = metadata.get('openslide.objective-power')
# print('magnification', magnification)
# print('metadata: ', metadata)

# real_pixel_size_x = mpp_x / 1000  # Convert microns to millimeters
# real_pixel_size_y = mpp_y / 1000  # Convert microns to millimeters
# real_width = width * real_pixel_size_x
# real_height = height * real_pixel_size_y
# print('real_width(mm): ', real_width, 'real_height(mm): ', real_height)


# import os
# import pandas as pd

# main_folder = '/raid/users/farzaneh/DeepPATH'
# slide_list = []
# def process_folders(path):
#     for item in os.listdir(path):
#         item_path = os.path.join(path, item)
#         if os.path.isdir(item_path):  # Check if it's a folder
#             process_folders(item_path)  # Continue searching in the subfolder
#         else:  
#             if item.endswith('.ndpi'):  
#                 slide = process_ndpi(item_path)  
#                 slide_list.append(slide)
#     df = pd.DataFrame(slide_list, columns =['file_path', 'magnification', 'num_levels', 'width', 'height', 'mpp_x', 'mpp_y' ]) 
#     df.to_csv('slide_list.csv', index=False)
#     return df


# # Function to process NDPI images
# def process_ndpi(file_path):
#     # print(f"Processing NDPI image: {file_path}")
#     slide = open_slide(file_path)
#     magnification = slide.properties[openslide.PROPERTY_NAME_OBJECTIVE_POWER]
#     num_levels = slide.level_count
#     width, height = slide.dimensions
#     mpp_x = float(slide.properties['openslide.mpp-x'])
#     mpp_y = float(slide.properties['openslide.mpp-y'])
#     return [file_path, magnification, num_levels, width, height, mpp_x, mpp_y]


# # Start processing from the main folder
# process_folders(main_folder)



# slide.close()


# # add two hdf5 files and make a new one
# # add two hdf5 files and make a new one
# import h5py
# import numpy as np
# from tqdm import tqdm

# f2 = h5py.File('/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_500/hdf5_Meso_500_he_train.h5', 'r')
# f1 = h5py.File('/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso/he/patches_h224_w224/hdf5_Meso_he_train.h5', 'r')
# path = '/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_500/hdf5_Meso_500_train_merged.h5'
# f_write = h5py.File(path, 'a')

# for key in f1.keys():
#     print(key)
#     shape_1 = f1[key].shape
#     shape_2 = f2[key].shape
#     if len(shape_1) == 1:
#         shape = (shape_1[0] + shape_2[0],)

#     elif len(shape_1) == 4:
#         shape = (shape_1[0] + shape_2[0], shape_1[1], shape_1[2], shape_1[3])
#     dset = f_write.create_dataset(key,shape=shape, dtype=f1[key].dtype)
#     # put data chunks into the new dataset
#     batch_size = 1000
#     for i in tqdm(range(0, shape_1[0], batch_size)):
#         if i+batch_size > shape_1[0]:
#             dset[i:shape_1[0]] = f1[key][i:]
#         else:
#             dset[i:i+batch_size] = f1[key][i:i+batch_size]
#     # dset.resize(shape_1[0]+shape_2[0], axis=0)
#     for i in tqdm(range(0,shape_2[0], batch_size)):
#         if i+batch_size > shape_1[0]+shape_2[0]:
#             dset[shape_1[0]+i:shape_1[0]+shape_2[0]] = f2[key][i:]
#         else:
#             dset[shape_1[0]+i:shape_1[0]+i+batch_size] = f2[key][i:i+batch_size]


# f_write.close()
# f1.close()
# f2.close()

# f = h5py.File(path, 'r')
# for key in f.keys():
#     print(key)
#     print(f[key].shape)
#     print(f[key].dtype)
#     print(f[key][0])
#     print(f[key][-1])


# read h5_file
import h5py
# main_path = '/mnt/cephfs/sharedscratch/users/fshahi/Projects/Histomorphological-Phenotype-Learning'
# dataset = 'Meso_100'
# h5_path_r = '{}/datasets/{}/he/patches_h224_w224/hdf5_{}_he_train.h5'.format(main_path, dataset, dataset)
# h5_path_w = '{}/dataset/{}/he/patches_h224_w224/hdf5_{}_he_complete.h5'.format(main_path, dataset, dataset)
h5_path_r = '/mnt/cephfs/home/users/fshahi/Projects/Datasets/bioclavis/mif/patches_h256_w256/hdf5_bioclavis_mif_npy.h5'
file = h5py.File(h5_path_r, 'r')
print(file.keys())
for key in file.keys():
    print(key)
    print(file[key][0])
    print(file[key][-1])
    print(file[key].shape)
    print(file[key].dtype)
    print('------------------')