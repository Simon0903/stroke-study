#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study_v1v2'

# Forloop for each patient
for i in 11 12
do
patient_number='P'$i
patientdir='Patient0'$i
echo $patientdir

# Forloop for each time point
for ii in `seq 1 3`
do
echo $pd

# $VARIABLES
tp='_V'$ii'_processed'
pd=$patientdir$tp
Lesion_mask=$patient_number'_V'$ii'_mask.nii'
for kk in `ls $ori/$workdir/$patient_number/Lesion_masks/PART*V$ii*`
do
T2FLAIR=$kk
echo $T2FLAIR
done

cd $ori/$workdir

cp $patient_number/Lesion_masks/$Lesion_mask $pd/to_targ/$Lesion_mask
cp $patient_number/Lesion_masks/$Lesion_mask $pd/Lesion_mask.nii
cp $T2FLAIR $pd/T2.nii
done
done