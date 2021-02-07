#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study'

# Forloop for each patient
for i in 7 8
do
patient_number='P0'$i
patientdir='Patient00'$i
echo $patientdir

# Forloop for each time point
for ii in `seq 3`
do
echo $pd
echo $dttpnii

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
cp $patient_number/Lesion_masks/$Lesion_mask $pd/Lesion_mask.nii
cp $T2FLAIR $pd/T2.nii

done
done