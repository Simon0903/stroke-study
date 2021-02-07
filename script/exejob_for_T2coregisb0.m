%-----------------------------------------------------------------------
% Job saved on 22-Dec-2020 07:33:16 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown

%-----------------------------------------------------------------------
rootSS = pwd;
matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {[rootSS,'\b0_dwi.img,1']};
matlabbatch{1}.spm.spatial.coreg.estwrite.source = {[rootSS,'\T2.nii,1']};
matlabbatch{1}.spm.spatial.coreg.estwrite.other = {[rootSS,'\Lesion_mask.nii,1']};
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'co_';
