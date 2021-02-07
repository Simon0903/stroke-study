#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study_v1v2'
cd $ori/$workdir

# Convert to b300_b1000.nii using fslsplit and fslmerge
for patientdir in Patient*/
do
echo $patientdir
cd $patientdir

#fslsplit allb_rawdata_abs_denoised_eddy_unrung.nii.gz -t
#fslmerge -t b300_b1000_rawdata_abs_denoised_eddy_unrung.nii.gz vol0000.nii.gz vol0001.nii.gz vol0002.nii.gz	vol0003.nii.gz	vol0004.nii.gz	vol0005.nii.gz	vol0006.nii.gz	vol0007.nii.gz	vol0008.nii.gz	vol0009.nii.gz	vol0010.nii.gz	vol0011.nii.gz	vol0012.nii.gz	vol0013.nii.gz	vol0014.nii.gz	vol0015.nii.gz	vol0016.nii.gz	vol0017.nii.gz	vol0018.nii.gz	vol0019.nii.gz	vol0020.nii.gz	vol0021.nii.gz	vol0022.nii.gz	vol0023.nii.gz	vol0024.nii.gz	vol0025.nii.gz	vol0026.nii.gz	vol0027.nii.gz	vol0028.nii.gz	vol0029.nii.gz	vol0030.nii.gz	vol0031.nii.gz	vol0032.nii.gz	vol0033.nii.gz	vol0034.nii.gz	vol0035.nii.gz	vol0036.nii.gz	vol0037.nii.gz	vol0038.nii.gz	vol0039.nii.gz	vol0040.nii.gz	vol0041.nii.gz	vol0042.nii.gz	vol0043.nii.gz	vol0044.nii.gz	vol0045.nii.gz	vol0046.nii.gz	vol0047.nii.gz	vol0048.nii.gz	vol0049.nii.gz	vol0050.nii.gz	vol0051.nii.gz	vol0052.nii.gz	vol0053.nii.gz	vol0054.nii.gz	vol0055.nii.gz	vol0056.nii.gz	vol0057.nii.gz	vol0058.nii.gz	vol0059.nii.gz	vol0060.nii.gz	vol0061.nii.gz
#rm vo* -r
fslroi allb_rawdata_abs_denoised_eddy_unrung.nii.gz b300_b1000_rawdata_abs_denoised_eddy_unrung.nii.gz 0 62

cd ..
done