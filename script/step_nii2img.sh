#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study'
cd $ori/$workdir

# Convert nii into hdr/img using fslchfiletype
for patientdir in Patient*/
do
echo $patientdir
cd $patientdir
#fslchfiletype ANALYZE allb_rawdata_abs_denoised_eddy_unrung NODDI_DWI.hdr
#fslchfiletype ANALYZE brain_mask brain_mask.hdr
#fslroi allb_rawdata_abs_denoised_eddy_unrung.nii.gz b0_dwi.nii.gz 0 1
fslchfiletype ANALYZE b0_dwi b0_dwi.hdr
cd ..
done