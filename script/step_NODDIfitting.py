import amico
import os 
import glob
ori='/mnt/d/UCL_project/data/'
os.chdir(ori)
protocal='Stroke_Study_v1v2'
os.chdir(protocal)

# Forloop for each patient
# NODDI fitting (https://github.com/daducci/AMICO/wiki/Fitting-the-NODDI-model)
for variable in glob.glob("Patient*"):
 subject=variable
 os.chdir(ori)
 print(subject)
 amico.core.setup()
 ae = amico.Evaluation(protocal, subject)
 ae.load_data(dwi_filename = "NODDI_DWI.img", scheme_filename = "NODDI_DWI.scheme", mask_filename = "brain_mask.img", b0_thr = 5)
 ae.set_model("NODDI")
 ae.generate_kernels()
 ae.load_kernels()
 ae.fit()
 ae.save_results()
 os.chdir(protocal)

