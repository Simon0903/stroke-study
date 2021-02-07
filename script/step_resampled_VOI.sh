#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study'
cd $ori/$workdir
for patientdir in Patient*/
do
cd $patientdir
mrgrid VOImask.nii regrid -template T2.nii Resampled_VOI_mask.nii -fill 0
cd ..
done
