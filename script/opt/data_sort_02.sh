#!bin/bash

# Sort Lesion_masks/T2FLAIR
ori='/mnt/d/UCL_project/data'
workdir='Patient'
cd $ori/$workdir
for i in `seq 10 24`
do
patient_number='P'$i
patientdir='Patient0'$i
for ii in `ls *${patientdir}*`
do

echo $ii
cp $ii $patient_number/Lesion_masks/$ii

done
done