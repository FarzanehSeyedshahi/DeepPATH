
import json
import openslide
from openslide import open_slide, ImageSlide
from openslide.deepzoom import DeepZoomGenerator

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


import os
import pandas as pd

main_folder = '/raid/users/farzaneh/DeepPATH'
slide_list = []
def process_folders(path):
    for item in os.listdir(path):
        item_path = os.path.join(path, item)
        if os.path.isdir(item_path):  # Check if it's a folder
            process_folders(item_path)  # Continue searching in the subfolder
        else:  
            if item.endswith('.ndpi'):  
                slide = process_ndpi(item_path)  
                slide_list.append(slide)
    df = pd.DataFrame(slide_list, columns =['file_path', 'magnification', 'num_levels', 'width', 'height', 'mpp_x', 'mpp_y' ]) 
    df.to_csv('slide_list.csv', index=False)
    return df


# Function to process NDPI images
def process_ndpi(file_path):
    # print(f"Processing NDPI image: {file_path}")
    slide = open_slide(file_path)
    magnification = slide.properties[openslide.PROPERTY_NAME_OBJECTIVE_POWER]
    num_levels = slide.level_count
    width, height = slide.dimensions
    mpp_x = float(slide.properties['openslide.mpp-x'])
    mpp_y = float(slide.properties['openslide.mpp-y'])
    return [file_path, magnification, num_levels, width, height, mpp_x, mpp_y]


# Start processing from the main folder
process_folders(main_folder)



# slide.close()
