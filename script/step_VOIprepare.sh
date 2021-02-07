#!bin/bash

# Sort VOI
ori='/mnt/d/UCL_project/data'
workdir='Spectroscopy_VOIs_lesion_name_sorted'
cd $ori/$workdir

for i in `seq 11 12`
do
for ii in `seq 1 2`
do
patientdir='Patient0'$i'_V'$ii'_processed'

for kk in `ls *Patient0$i*V$ii*`
do
VOImask=$kk
echo $VOImask
done

mv $VOImask /mnt/d/UCL_project/data/Stroke_Study_v1v2/$patientdir/VOImask.nii

done
done