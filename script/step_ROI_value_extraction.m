clc;clear;
scpdir=pwd;
ori='D:/UCL_project/data';
workdir='Stroke_Study';
cd([ori,'/',workdir])

ROI_value_extracton('V1','dttp*_to_targ_fa*')
ROI_value_extracton('V2','dttp*_to_targ_fa*')
ROI_value_extracton('V3','dttp*_to_targ_fa*')

ROI_value_extracton('V1','dttp*_to_targ_md*')
ROI_value_extracton('V2','dttp*_to_targ_md*')
ROI_value_extracton('V3','dttp*_to_targ_md*')

ROI_value_extracton('V1','dttp*_to_targ_ad*')
ROI_value_extracton('V2','dttp*_to_targ_ad*')
ROI_value_extracton('V3','dttp*_to_targ_ad*')

ROI_value_extracton('V1','dttp*_to_targ_rd*')
ROI_value_extracton('V2','dttp*_to_targ_rd*')
ROI_value_extracton('V3','dttp*_to_targ_rd*')

ROI_value_extracton('V1','co_dki_mk_to_targ.nii')
ROI_value_extracton('V2','co_dki_mk_to_targ.nii')
ROI_value_extracton('V3','co_dki_mk_to_targ.nii')

ROI_value_extracton('V1','co_dki_ak_to_targ.nii')
ROI_value_extracton('V2','co_dki_ak_to_targ.nii')
ROI_value_extracton('V3','co_dki_ak_to_targ.nii')

ROI_value_extracton('V1','co_dki_rk_to_targ.nii')
ROI_value_extracton('V2','co_dki_rk_to_targ.nii')
ROI_value_extracton('V3','co_dki_rk_to_targ.nii')

ROI_value_extracton('V1','co_FIT_ICVF_to_targ.nii')
ROI_value_extracton('V2','co_FIT_ICVF_to_targ.nii')
ROI_value_extracton('V3','co_FIT_ICVF_to_targ.nii')

ROI_value_extracton('V1','co_FIT_ISOVF_to_targ.nii')
ROI_value_extracton('V2','co_FIT_ISOVF_to_targ.nii')
ROI_value_extracton('V3','co_FIT_ISOVF_to_targ.nii')

ROI_value_extracton('V1','co_FIT_OD_to_targ.nii')
ROI_value_extracton('V2','co_FIT_OD_to_targ.nii')
ROI_value_extracton('V3','co_FIT_OD_to_targ.nii')

ROI_value_extracton_for_WMTI('V1','co_WMTI_AWF_to_targ.nii')
ROI_value_extracton_for_WMTI('V2','co_WMTI_AWF_to_targ.nii')
ROI_value_extracton_for_WMTI('V3','co_WMTI_AWF_to_targ.nii')

ROI_value_extracton_for_WMTI('V1','co_WMTI_Da_to_targ.nii')
ROI_value_extracton_for_WMTI('V2','co_WMTI_Da_to_targ.nii')
ROI_value_extracton_for_WMTI('V3','co_WMTI_Da_to_targ.nii')

ROI_value_extracton_for_WMTI('V1','co_WMTI_Dea_to_targ.nii')
ROI_value_extracton_for_WMTI('V2','co_WMTI_Dea_to_targ.nii')
ROI_value_extracton_for_WMTI('V3','co_WMTI_Dea_to_targ.nii')

ROI_value_extracton_for_WMTI('V1','co_WMTI_Der_to_targ.nii')
ROI_value_extracton_for_WMTI('V2','co_WMTI_Der_to_targ.nii')
ROI_value_extracton_for_WMTI('V3','co_WMTI_Der_to_targ.nii')

ROI_value_extracton_for_WMTI('V1','co_WMTI_TORT_to_targ.nii')
ROI_value_extracton_for_WMTI('V2','co_WMTI_TORT_to_targ.nii')
ROI_value_extracton_for_WMTI('V3','co_WMTI_TORT_to_targ.nii')

cd(scpdir)
%%
function ROI_value_extracton(visit,filename)
% filename must be string
LIST=dir(['Patient*',visit,'*']);
ROItemp=zeros(size(LIST,1),2);
for j = 1:size(LIST,1)
    cd([LIST(j).name,'/targ_space'])
    
    % Load image
    file = dir(filename);
    IDX = load_nii(file.name);
    IDX_img = IDX.img;
    
    %{
    % Load GMWMmask mask
    corGMWMmask = load_nii('co_GMWMmask_to_targ.nii');
    GMWMmask = corGMWMmask.img;
    GMWMmask = single(GMWMmask);
    GMWMmask(GMWMmask <=0)=0;
    GMWMmask(GMWMmask >0)=1;
    GMWMmask(isnan(GMWMmask)) = 0;
    %}
    
    % Load Lesion mask mask
    corLesion_mask = load_nii('co_Lesion_mask_to_targ.nii');
    Lesionmask = corLesion_mask.img;
    Lesionmask(Lesionmask <=0)=0;
    Lesionmask(Lesionmask >0)=1;
    Lesionmask(isnan(Lesionmask)) = 0;
    
    % Multiply Lesion mask, GMWMmask mask and image
    %mtemp = Lesionmask.*GMWMmask.*IDX_img;
    mtemp = Lesionmask.*IDX_img;
    mtemp(isnan(IDX_img)) = 0;
    mtemp(isinf(IDX_img)) = 0;
    
    % Extraction values
    [x,y,z]=find(mtemp);
    ROItemp(j,1) = nanmean(z(:));
    ROItemp(j,2) = prctile(z(:),10);
    ROItemp(j,3) = prctile(z(:),50);
    ROItemp(j,4) = prctile(z(:),90);
    ROItemp(j,5) = nanstd(z(:));
    cd ../..
end

% Save results
filenamesplit = strsplit(file.name,'.');
save(['ROI_',visit,'_',filenamesplit{1},'.mat'], 'ROItemp')

end
%%
function ROI_value_extracton_for_WMTI(visit,filename)
% filename must be string
LIST=dir(['Patient*',visit,'*']);
ROItemp=zeros(size(LIST,1),5);
for j = 1:size(LIST,1)
    cd([LIST(j).name,'/targ_space'])
    
    % Load image
    file = dir(filename);
    IDX = load_nii(file.name);
    IDX_img = IDX.img;
    
    % Multiply Lesion mask, GMWMmask mask and image
    mtemp = IDX_img;
    mtemp(isnan(IDX_img)) = 0;
    mtemp(isinf(IDX_img)) = 0;
    
    % Extraction values
    [x,y,z]=find(mtemp);
    [B,TF] = rmoutliers(z,'median');
    ROItemp(j,1) = nanmean(B(:));
    ROItemp(j,2) = prctile(B(:),10);
    ROItemp(j,3) = prctile(B(:),50);
    ROItemp(j,4) = prctile(B(:),90);
    ROItemp(j,5) = nanstd(B(:));
    
    cd ../..
end

% Save results
filenamesplit = strsplit(file.name,'.');
save(['ROI_',visit,'_',filenamesplit{1},'.mat'], 'ROItemp')

end