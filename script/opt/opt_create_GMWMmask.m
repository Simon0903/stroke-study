clc;clear;
ori='D:/UCL_project/data';
workdir='Stroke_Study';
cd([ori,'/',workdir])
rootd = pwd;
LIST=dir('Patient*');

% Forloop for each patient
for j = 1:size(LIST,1)
    cd(LIST(j).name)
    mkdir('T2_GMWMmask')
    rootSS = pwd;
    nrun = 1;
    
    % estimate grey matter and white matter mask using SPM
    jobfile = {'D:\UCL_project\bash_script\exejob_for_create_GMWMmask.m'};
    jobs = repmat(jobfile, 1, nrun);
    inputs = cell(0, nrun);
    for crun = 1:nrun
    end
    spm('defaults', 'FMRI');
    spm_jobman('serial', jobs, '', inputs{:});
    
    % Collect GMWMmask file
    movefile('c1T2.nii','T2_GMWMmask/c1T2.nii')
    movefile('c2T2.nii','T2_GMWMmask/c2T2.nii')
    movefile('c3T2.nii','T2_GMWMmask/c3T2.nii')
    movefile('c4T2.nii','T2_GMWMmask/c4T2.nii')
    movefile('c5T2.nii','T2_GMWMmask/c5T2.nii')
    movefile('GMWMmask.nii','T2_GMWMmask/GMWMmask.nii')
    movefile('T2_seg8.mat','T2_GMWMmask/T2_seg8.mat')
    cd ..
    
end