#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study'
cd $ori/$workdir

# gunzip all file
for patientdir in Patient*/
do
echo $patientdir
cd $patientdir/targ_space

for sub in *.gz
do
gunzip $sub
done

cd ../..
done