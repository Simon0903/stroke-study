#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study_v1v2'
cd $ori/$workdir

# Fitting DTI using dtifit
for patientdir in Patient*/
do
echo $patientdir
dtifit --data=$patientdir/b300_b1000_rawdata_abs_denoised_eddy_unrung.nii.gz --out=$patientdir/tensor --mask=$patientdir/brain_mask.nii.gz --bvecs=$patientdir/fsl_b300_b1000_data_bvecs.txt --bvals=$patientdir/fsl_b300_b1000_data_bvals.txt --wls
cd $patientdir

# Move tensor_file into dt Folder
mkdir dt
for filename in tensor_*
do
mv $filename dt/$filename
done

# Convert tensor_file from fsl-format to dtitk-format
cd dt
fsl_to_dtitk tensor
cd $ori/$workdir
done