ori='D:/UCL_project/data'
workdir='Stroke_Study_v1v2'
cd([ori,'/',workdir])

% to put bvals bvecs into 'fsl2scheme'
bvals = 'all_data_bvals.txt'
bvecs = 'all_data_bvecs.txt'
filename= ['fsl_',bvals]
filename2= ['fsl_',bvecs]

% Forloop for each patient
LIST = dir('Patient*')
for i=1:length(LIST)
    cd(LIST(i).name) 
    
    % Transverse bvals bvecs
    Bfiletrans(bvals,bvecs,filename,filename2)
    bvalsFilename=[pwd,'/fsl_all_data_bvals.txt'];
    bvecsFilename=[pwd,'/fsl_all_data_bvecs.txt'];
    schemeFilename=[pwd,'/NODDI_DWI.scheme'];

    % Convert bvals bvecs from fsl-format to AMICO-format
    AMICO_fsl2scheme( bvalsFilename, bvecsFilename, schemeFilename )
    cd ..
end
