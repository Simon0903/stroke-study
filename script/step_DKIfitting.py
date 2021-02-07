import os
import shutil
import glob
import numpy as np
import matplotlib.pyplot as plt
import dipy.reconst.dki as dki
import dipy.reconst.dti as dti
from dipy.core.gradients import gradient_table
from dipy.data import get_fnames
from dipy.io.gradients import read_bvals_bvecs
from dipy.io.image import load_nifti
from dipy.io.image import save_nifti
from dipy.segment.mask import median_otsu
from scipy.ndimage.filters import gaussian_filter

ori='/mnt/d/UCL_project/data/'
os.chdir(ori)
protocal='Stroke_Study_v1v2'
os.chdir(protocal)

# Forloop for each patient
# DKI fitting (https://dipy.org/documentation/1.3.0./examples_built/reconst_dki/#example-reconst-dki)
for subject in glob.glob("Patient0*"):
 os.chdir(subject)

 # Collecting fraw fbval fbvec
 fraw='allb_rawdata_abs_denoised_eddy_unrung.nii.gz'
 fbval='fsl_all_data_bvals.txt'
 fbvec='fsl_all_data_bvecs.txt'
 mask='brain_mask.nii.gz'
 maskdata, affine = load_nifti(mask)
 data, affine = load_nifti(fraw)
 bvals, bvecs = read_bvals_bvecs(fbval, fbvec)
 gtab = gradient_table(bvals, bvecs)

 # Smoothing
 fwhm = 1.25
 gauss_std = fwhm / np.sqrt(8 * np.log(2))  # converting fwhm to Gaussian std
 data_smooth = np.zeros(data.shape)
 for v in range(data.shape[-1]):
    data_smooth[..., v] = gaussian_filter(data[..., v], sigma=gauss_std)
 
 # Fitting
 dkimodel = dki.DiffusionKurtosisModel(gtab)
 dkifit = dkimodel.fit(data_smooth, mask=maskdata)
 FA = dkifit.fa
 MD = dkifit.md
 AD = dkifit.ad
 RD = dkifit.rd
 MK = dkifit.mk(0, 3)
 AK = dkifit.ak(0, 3)
 RK = dkifit.rk(0, 3)
 MKT = dkifit.mkt(0, 3)
 KFA = dkifit.kfa

 # Save nii
 save_nifti('dki_fa.nii.gz',FA,affine)
 save_nifti('dki_md.nii.gz',MD,affine)
 save_nifti('dki_ad.nii.gz',AD,affine)
 save_nifti('dki_rd.nii.gz',RD,affine)
 save_nifti('dki_mk.nii.gz',MK,affine)
 save_nifti('dki_ak.nii.gz',AK,affine)
 save_nifti('dki_rk.nii.gz',RK,affine)
 save_nifti('dki_mkt.nii.gz',MKT,affine)
 save_nifti('dki_kfa.nii.gz',KFA,affine)

# Move dki_file into DKI Folder
 os.mkdir('DKI/')
 for fname in glob.glob("dki_*"): 
    shutil.move(fname, './DKI')
    
 os.chdir(ori)   
 os.chdir(protocal)