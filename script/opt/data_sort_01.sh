#!bin/bash

# Sort Lesion_masks
ori='/mnt/d/UCL_project/data'
workdir='all_data_for_ShiMing/Lesion_Masks'
cd $ori/$workdir
for i in `seq 3 9`
do
patient_number='P0'$i
mkdir $patient_number
mkdir $patient_number/Lesion_masks

v1=$patient_number'_V1_mask.nii'
v2=$patient_number'_V2_mask.nii'
v3=$patient_number'_V3_mask.nii'
cp $v1 $patient_number/Lesion_masks/$v1
cp $v2 $patient_number/Lesion_masks/$v2
cp $v3 $patient_number/Lesion_masks/$v3

done