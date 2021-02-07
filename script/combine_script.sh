#!bin/bash

sh opt_allb2twobnii.sh
python step3_NODDIfitting.py 
sh step4_DTIfitting.sh 
python step5_DKIfitting.py
python step6_WMTIfitting.py
sh step7_IntraSubj_Align.sh