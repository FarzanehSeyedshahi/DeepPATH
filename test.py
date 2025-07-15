# Reading two hdf5 files and merging them on the common keys
import h5py
from tqdm import tqdm
h1 = h5py.File('/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_large/he/patches_h224_w224/hdf5_Meso_large_he_valid.h5', 'r')
# h2 = h5py.File('/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_500/he/patches_h224_w224/hdf5_Meso_500_he_validation.h5', 'r')
# h3 = h5py.File('/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_large/he/patches_h224_w224/hdf5_Meso_valid.h5', 'w')
# for key in h1.keys():
#     print(key)
#     print(h1[key].shape)
#     print(h2[key].shape)
#     shape = (h1[key].shape[0]+h2[key].shape[0],)+ h1[key].shape[1:]
#     h3.create_dataset(key, shape=shape, dtype=h1[key].dtype)
#     # for i in tqdm(range(h1[key].shape[0])):
#     #     h3[key][i] = h1[key][i]
#     # for i in tqdm(range(h2[key].shape[0])):
#     #     h3[key][i+h1[key].shape[0]] = h2[key][i]
#     h3[key][:h1[key].shape[0]] = h1[key][:]
#     h3[key][h1[key].shape[0]:] = h2[key][:]
# h3.close()
# h1.close()
# h2.close()

h3 = h5py.File('/mnt/cephfs/home/users/fshahi/Projects/Datasets/Meso_large/he/patches_h224_w224/hdf5_Meso_valid.h5', 'r')
print(h3.keys())
for key in h3.keys():
    print(key)
    print(h3[key].shape)
    print(h3[key].dtype)
    print(h3[key][0])
    print(h3[key][-1])
h3.close()