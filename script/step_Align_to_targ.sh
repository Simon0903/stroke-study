#!bin/bash

ori='/mnt/d/UCL_project/data'
workdir='Stroke_Study_v1v2'

# Use which tensor-drived image to produce transformation matrix
ref='md'

# Forloop for each patient 10 13 14 15 16 17 18 19 20 24
for i in 11 12
do
patient_number='P'$i
patientdir='Patient0'$i
echo $patientdir

# Forloop for each time point
for ii in `seq 1 2`
do
echo $pd

# $VARIABLES
tp='_V'$ii'_processed'
pd=$patientdir$tp
dttpnii='dttp'$ii'_to_targ.nii.gz'
dttptrnii='dttp'$ii'_to_targ_tr.nii.gz'
dttpmdnii='dttp'$ii'_to_targ_md.nii.gz'
tptotargaff='rigid_tp'$ii'_to_targ.aff'

cd $ori/$workdir
mkdir $pd/to_targ/

# Collect dttp'$ii'_to_targ.nii.gz and rigid_tp'$ii'_to_targ.aff
#cp $patient_number/IntraSubjGrpTemplate_tensor/targSpace_init/$dttpnii $pd/to_targ/$dttpnii
cp $patient_number/IntraSubjGrpTemplate_tensor/IntraSubjGrpTemplate/targSpace_init/$dttpnii $pd/to_targ/$dttpnii

#cp $patient_number/IntraSubjGrpTemplate_tensor/targSpace_init/$tptotargaff $pd/to_targ/$tptotargaff
cp $patient_number/IntraSubjGrpTemplate_tensor/IntraSubjGrpTemplate/targSpace_init/$tptotargaff $pd/to_targ/$tptotargaff

cp $pd/T2cob0/co_Lesion_mask.nii $pd/to_targ/co_Lesion_mask.nii

# Collect tensor_dtitk.nii.gz
cp $pd/dt/tensor_dtitk.nii.gz $pd/to_targ/tensor_dtitk.nii.gz

# Collect FSL-format tensor-drived indices
cp $pd/dt/tensor_FA.nii.gz $pd/to_targ/tensor_fa.nii.gz
cp $pd/dt/tensor_L1.nii.gz $pd/to_targ/tensor_ad.nii.gz
cp $pd/dt/tensor_MD.nii.gz $pd/to_targ/tensor_md.nii.gz

# Fitting DTI using TVtool
cd $pd/to_targ/
TVtool -in tensor_dtitk.nii.gz -fa
TVtool -in tensor_dtitk.nii.gz -tr
fslmaths tensor_dtitk_tr.nii.gz -div 3 tensor_dtitk_md.nii.gz
TVtool -in tensor_dtitk.nii.gz -ad
TVtool -in tensor_dtitk.nii.gz -rd
TVtool -in $dttpnii -fa
TVtool -in $dttpnii -tr
fslmaths $dttptrnii -div 3 $dttpmdnii
TVtool -in $dttpnii -ad
TVtool -in $dttpnii -rd

# $VARIABLES
dttprefnii='dttp'$ii'_to_targ_'$ref'.nii.gz'
dtitktensor='tensor_dtitk_'$ref'.nii.gz'
fsltensor='tensor_'$ref'.nii.gz'
cofsltensor='co_tensor_'$ref'.nii.gz'
trans_matrix='co_tensor_'$ref'.mat'

# Estimate transformation matrix (Do coregistration into dtitk-tensor from fsl-tensor)
flirt -in $fsltensor -ref $dtitktensor -out $cofsltensor -omat $trans_matrix -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6 -interp trilinear

# Apply transformation matrix to NODDI image (Do coregistration into dtitk-tensor)
flirt -in ../AMICO/NODDI/FIT_dir.nii.gz -ref $dtitktensor -out co_FIT_dir.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../AMICO/NODDI/FIT_ICVF.nii.gz -ref $dtitktensor -out co_FIT_ICVF.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../AMICO/NODDI/FIT_ISOVF.nii.gz -ref $dtitktensor -out co_FIT_ISOVF.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../AMICO/NODDI/FIT_OD.nii.gz -ref $dtitktensor -out co_FIT_OD.nii.gz -applyxfm -init $trans_matrix -interp trilinear

# Apply transformation matrix to DKI image (Do coregistration into dtitk-tensor)
flirt -in ../DKI/dki_mk.nii.gz -ref $dtitktensor -out co_dki_mk.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../DKI/dki_ak.nii.gz -ref $dtitktensor -out co_dki_ak.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../DKI/dki_rk.nii.gz -ref $dtitktensor -out co_dki_rk.nii.gz -applyxfm -init $trans_matrix -interp trilinear

# Apply transformation matrix to WMTI image (Do coregistration into dtitk-tensor)
flirt -in ../WMTI/WMTI_AWF.nii.gz -ref $dtitktensor -out co_WMTI_AWF.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../WMTI/WMTI_Da.nii.gz -ref $dtitktensor -out co_WMTI_Da.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../WMTI/WMTI_Dea.nii.gz -ref $dtitktensor -out co_WMTI_Dea.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../WMTI/WMTI_Der.nii.gz -ref $dtitktensor -out co_WMTI_Der.nii.gz -applyxfm -init $trans_matrix -interp trilinear
flirt -in ../WMTI/WMTI_TORT.nii.gz -ref $dtitktensor -out co_WMTI_TORT.nii.gz -applyxfm -init $trans_matrix -interp trilinear

# Apply transformation matrix to Lesion_mask (Do coregistration into dtitk-tensor)
flirt -in co_Lesion_mask.nii -ref $dtitktensor -out co_dtitk_Lesion_mask.nii.gz -applyxfm -init $trans_matrix -interp nearestneighbour

# Apply transformation matrix to NODDI image (Do registration into target)
affineScalarVolume -in co_FIT_dir.nii.gz -out co_FIT_dir_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_FIT_ICVF.nii.gz -out co_FIT_ICVF_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_FIT_ISOVF.nii.gz -out co_FIT_ISOVF_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_FIT_OD.nii.gz -out co_FIT_OD_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii

# Apply transformation matrix to DKI image (Do registration into target)
affineScalarVolume -in co_dki_mk.nii.gz -out co_dki_mk_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_dki_ak.nii.gz -out co_dki_ak_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_dki_rk.nii.gz -out co_dki_rk_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii

# Apply transformation matrix to WMTI image (Do registration into target)
affineScalarVolume -in co_WMTI_AWF.nii.gz -out co_WMTI_AWF_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_WMTI_Da.nii.gz -out co_WMTI_Da_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_WMTI_Dea.nii.gz -out co_WMTI_Dea_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_WMTI_Der.nii.gz -out co_WMTI_Der_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii
affineScalarVolume -in co_WMTI_TORT.nii.gz -out co_WMTI_TORT_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii

# Apply transformation matrix to Lesion_mask (Do registration into target)
affineScalarVolume -in co_dtitk_Lesion_mask.nii.gz -out co_Lesion_mask_to_targ.nii.gz -trans $tptotargaff -target $dttprefnii -interp 1

# Create targ_space Folder
mkdir $ori/$workdir/$pd/targ_space
cp *_to_targ* ../targ_space/ -r
#rm $ori/$workdir/$pd/to_targ -r
done
done