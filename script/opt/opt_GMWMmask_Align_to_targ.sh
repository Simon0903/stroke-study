#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study'

# Use which tensor-drived image to produce transformation matrix
ref='md'

# Forloop for each patient
for i in 10 13 14 15 16 17 18 19 20 24
do
patient_number='P'$i
patientdir='Patient0'$i
echo $patientdir

# Forloop for each time point
for ii in `seq 3`
do
tp='_V'$ii'_processed'
pd=$patientdir$tp
echo $pd

# $VARIABLES
dttprefnii='dttp'$ii'_to_targ_'$ref'.nii.gz'
dtitktensor='tensor_dtitk_'$ref'.nii.gz'
trans_matrix='co_tensor_'$ref'.mat'
tptotargaff='rigid_tp'$ii'_to_targ.aff'

cd $ori/$workdir
cd $pd/to_targ/

# Apply transformation matrix to GMWMmask (Do coregistration into dtitk-tensor)
flirt -in ../T2_GMWMmask/GMWMmask.nii -ref ../b0_dwi.nii.gz -out co_GMWMmask_alignb0.nii.gz -applyxfm -init co_T2_b0.mat -interp nearestneighbour
flirt -in co_GMWMmask_alignb0.nii.gz -ref $dtitktensor -out co_GMWMmask.nii.gz -applyxfm -init $trans_matrix -interp nearestneighbour

# Apply transformation matrix to GMWMmask (Do registration into target)
affineScalarVolume -in co_GMWMmask.nii.gz -out co_GMWMmask_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii -interp 1

# copy to targ_space Folder
cp co_GMWMmask_to_targ.nii.gz ../targ_space/co_GMWMmask_to_targ.nii.gz

done
done