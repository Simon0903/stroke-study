#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study_v1v2'
cd $ori/$workdir

# Forloop for each patient
for i in 11 12
do
patient_number='P'$i
patient_txt=$patient_number'_dt_tp_list.txt'

# Create dt_tp_list.txt
cat > $patient_txt << EOF
Patient0${i}_V1_processed/dt/tensor_dtitk.nii.gz
Patient0${i}_V2_processed/dt/tensor_dtitk.nii.gz
EOF
mv $patient_txt $patient_number/$patient_txt
#Patient0${i}_V3_processed/dt/tensor_dtitk.nii.gz

# Align each time point using IntraSubjGrpAlign
IntraSubjGrpAlign $ori/$workdir $patient_number/$patient_txt
cp IntraSubjGrpTemplate $patient_number/IntraSubjGrpTemplate_tensor -r
rm IntraSubjGrpTemplate -r

done