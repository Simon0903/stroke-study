clc;clear;
scpdir=pwd;
ori='D:/UCL_project/data';
workdir='Stroke_Study';
cd([ori,'/',workdir])
mkdir('hist')
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
set(0,'DefaultFigureVisible', 'off')
LIST=dir(['Patient*',visit,'*']);
for j = 1:size(LIST,1)
    cd([LIST(j).name,'/targ_space'])
    
    % Load image
    file = dir(filename);
    IDX = load_nii(file.name);
    IDX_img = IDX.img;
    
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
    
    % plot histogram
    [x,y,z]=find(mtemp);
    figure;histogram(z(:));    
    filenamesplit = strsplit(file.name,'.');
    set(gcf,'position',[0,0,800,500])
    cd ../..    
    saveas(gcf,['hist/',LIST(j).name,'_',filenamesplit{1},'.png'])
end
end
%%
function ROI_value_extracton_for_WMTI(visit,filename)
% filename must be string
set(0,'DefaultFigureVisible', 'off')
LIST=dir(['Patient*',visit,'*']);
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
    
    % plot histogram
    [x,y,z]=find(mtemp);
    [B,TF] = rmoutliers(z,'median');
    figure;histogram(B(:));
    filenamesplit = strsplit(file.name,'.');
    set(gcf,'position',[0,0,800,500])
    cd ../..
    saveas(gcf,['hist/',LIST(j).name,'_',filenamesplit{1},'.png'])
end

end