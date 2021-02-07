import os
import shutil
import glob
import numpy as np
import matplotlib.pyplot as plt
import dipy.reconst.dki as dki
import dipy.reconst.dki_micro as dki_micro
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
# WMTI fitting (https://dipy.org/documentation/1.3.0./examples_built/reconst_dki_micro/#example-reconst-dki-micro)
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
 gauss_std = fwhm / np.sqrt(8 * np.log(2))
 data_smooth = np.zeros(data.shape)
 for v in range(data.shape[-1]):
    data_smooth[..., v] = gaussian_filter(data[..., v], sigma=gauss_std)
 dki_micro_model = dki_micro.KurtosisMicrostructureModel(gtab)

 # Diffusion Tensor is computed based on the standard DKI model
 dkimodel = dki.DiffusionKurtosisModel(gtab)
 dkifit = dkimodel.fit(data_smooth, mask=maskdata)


 # Initialize well aligned mask with ones
 well_aligned_mask = np.ones(data.shape[:-1], dtype='bool')

 # Diffusion coefficient of linearity (cl) has to be larger than 0.4, thus
 # we exclude voxels with cl < 0.4.
 cl = dkifit.linearity.copy()
 well_aligned_mask[cl < 0.4] = False

 # Diffusion coefficient of planarity (cp) has to be lower than 0.2, thus
 # we exclude voxels with cp > 0.2.
 cp = dkifit.planarity.copy()
 well_aligned_mask[cp > 0.2] = False

 # Diffusion coefficient of sphericity (cs) has to be lower than 0.35, thus
 # we exclude voxels with cs > 0.35.
 cs = dkifit.sphericity.copy()
 well_aligned_mask[cs > 0.35] = False

 # Removing nan associated with background voxels
 well_aligned_mask[np.isnan(cl)] = False
 well_aligned_mask[np.isnan(cp)] = False
 well_aligned_mask[np.isnan(cs)] = False

 # Fitting
 dki_micro_fit = dki_micro_model.fit(data_smooth, mask=well_aligned_mask)
 AWF = dki_micro_fit.awf
 TORT = dki_micro_fit.tortuosity
 Da = dki_micro_fit.axonal_diffusivity
 Dea = dki_micro_fit.hindered_ad
 Der = dki_micro_fit.hindered_rd

 # Save nii
 save_nifti('WMTI_AWF.nii.gz',AWF,affine)
 save_nifti('WMTI_TORT.nii.gz',TORT,affine)
 save_nifti('WMTI_Da.nii.gz',Da,affine)
 save_nifti('WMTI_Dea.nii.gz',Dea,affine)
 save_nifti('WMTI_Der.nii.gz',Der,affine)

# Move WMTI_file into WMTI Folder
 os.mkdir('WMTI/')
 for fname in glob.glob("WMTI_*"):
    shutil.move(fname, './WMTI')

 os.chdir(ori)   
 os.chdir(protocal)