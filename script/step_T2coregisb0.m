clc;clear;
ori='D:/UCL_project/data';
workdir='Stroke_Study_v1v2';
cd([ori,'/',workdir])
rootd = pwd;
LIST=dir('Patient*');

% Forloop for each patient
for j = 1:size(LIST,1)
    cd(LIST(j).name)
    mkdir('T2cob0')
    rootSS = pwd;
    nrun = 1;
    
    % Coregister T2 to B0
    jobfile = {'D:\UCL_project\bash_script\exejob_for_T2coregisb0.m'};
    jobs = repmat(jobfile, 1, nrun);
    inputs = cell(0, nrun);
    for crun = 1:nrun
    end
    spm('defaults', 'FMRI');
    spm_jobman('run', jobs, inputs{:});
    
    % Collect T2cob0 file
    movefile('co_T2.nii','T2cob0/co_T2.nii')
    movefile('co_Lesion_mask.nii','T2cob0/co_Lesion_mask.nii')
    cd ..
end