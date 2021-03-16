clc;clear;
scpdir=pwd;
ori='D:/UCL_project/data';
workdir='Stroke_Study/Patient020_V1_processed/T2cob0/';
cd([ori,'/',workdir])

slice_matrix=[1];
% kk='DKI/'
% rm_slice('DKI/dki_ak.nii','dki_ak.nii',slice_matrix,kk)
% rm_slice('DKI/dki_mk.nii','dki_mk.nii',slice_matrix,kk)
% rm_slice('DKI/dki_rk.nii','dki_rk.nii',slice_matrix,kk)
% kk='AMICO/NODDI/'
% rm_slice('AMICO/NODDI/FIT_ICVF.nii','FIT_ICVF.nii',slice_matrix,kk)
% rm_slice('AMICO/NODDI/FIT_ISOVF.nii','FIT_ISOVF.nii',slice_matrix,kk)
% rm_slice('AMICO/NODDI/FIT_OD.nii','FIT_OD.nii',slice_matrix,kk)

rm_slice('co_Lesion_mask.nii','co_Lesion_mask.nii',slice_matrix)
% kk='to_targ/'
% rm_slice('to_targ/tensor_dtitk_ad.nii','tensor_dtitk_ad.nii',slice_matrix,kk)
% rm_slice('to_targ/tensor_dtitk_fa.nii','tensor_dtitk_fa.nii',slice_matrix,kk)
% rm_slice('to_targ/tensor_dtitk_md.nii','tensor_dtitk_md.nii',slice_matrix,kk)
% rm_slice('to_targ/tensor_dtitk_rd.nii','tensor_dtitk_rd.nii',slice_matrix,kk)
% rm_slice('to_targ/tensor_dtitk_tr.nii','tensor_dtitk_tr.nii',slice_matrix,kk)

cd(scpdir)

function rm_slice(input,output,slice_matrix)

tmp=load_nii(input)

for sil=1:length(slice_matrix)
    tmp_slice=slice_matrix(sil);
    tmp.img(:,:,tmp_slice)=zeros(size(tmp.img,1),size(tmp.img,2));
end
save_nii(tmp,output)
end
