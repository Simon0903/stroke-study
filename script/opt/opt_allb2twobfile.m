ori='D:/UCL_project/data'
workdir='Stroke_Study_v1v2'
cd([ori,'/',workdir])

% to put bvals bvecs into 'fsl2scheme'
bvals = 'all_data_bvals.txt'
bvecs = 'all_data_bvecs.txt'
bvals_1000 = 'b300_b1000_data_bvals.txt'
bvecs_1000 = 'b300_b1000_data_bvecs.txt'
filename3= ['fsl_',bvals_1000]
filename4= ['fsl_',bvecs_1000]

% Forloop for each patient
LIST = dir('Patient*')
for i=1:length(LIST)
    cd(LIST(i).name) 
    
    % Transverse bvals bvecs
    BfileDTI(bvals,bvecs,bvals_1000,bvecs_1000)
    Bfiletrans(bvals_1000,bvecs_1000,filename3,filename4)

    cd ..
end
