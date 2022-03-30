#!/usr/bin/env sh
#===============================================================================
# Purpose:
#
# Notes: 
# 
# History:
# o 2020 Oct, B. Kauffman, first version
#===============================================================================
echo ${0} "ENTER"

set -e   # trap shell errors
#trap '[[ $BASH_COMMAND != echo* ]] && $BASH_COMMAND' DEBUG

if [ x${2} == x ]; then
   echo "Usage: ${0} LID CASEDIR"
   exit
fi

LID=${1}
CASEDIR=${2}

source ${CASEDIR}/JRA_include.sh   # input parameters
LOGFILE=${CASEDIR}/${0}.${LID}
echo "$0 LOGFILE = $LOGFILE"
echo "$0 HOMEDIR = $LOGFILE"
#-------------------------------------------------------------------------------

echo "==========================================================================="
echo "8 Create dataset product for input4MIPs "                
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " When updating data in the middle of a year -------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/for_mricom
pwd

LOGFILE=$CASEDIR/make_mricom_latest.$LID
time ./make_mricom_latest.sh  $YEARs $ODAYe   >& $LOGFILE
#  input: .../linkdir/work/jra55fcst_filt_3hr_TL319       # slprs, brtmp, ice
#  input: .../linkdir/work/jra55fcst_v1_3_prod3_3hr_TL319 # tmp10m sph10m
#  input: .../linkdir/work/jra55fcst_v1_3_prod1_3hr_TL319 # u10m v10m
#  input: .../linkdir/work/jra55fcst_v1_3_rad2_3hr_TL319  # dswrf dlwrf v1_3 => const correction
#  input: .../linkdir/work/jra55fcst_v1_3_prcp2_3hr_TL319 # rain snow
# output: .../linkdir/products/version_1_5/grads (excluding rain data which was created in step 7)

#-----------------------------------------------------------------------------------------
echo " Intermediate netCDF data -------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/for_omip
pwd

LOGFILE=$CASEDIR/create_netcdf_v1_5.$LID
time ./create_netcdf_v1_5.sh  $YEARs $YEARe $DATESTRc $ODAYe >& $LOGFILE
#  input: .../linkdir/products/version_1_5/grads
# output: .../linkdir/products/version_1_5/netCDF

#-----------------------------------------------------------------------------------------
echo " CMORized files for input4MIPs---------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/for_omip_cmor/MRI-JMA-JRA55-do-1-5-0 
pwd

sed -e s/@year@/${YEARe}/ \
    -e s/@create@/${DATESTRc}/ \
    runCmorAllWrite-1-5-0-update-atmos.py_template > runCmorAllWrite-1-5-0-update-atmos.py

# conda init
# conda activate mypy38  # BK: must set up this python env prior to running this script
python  runCmorAllWrite-1-5-0-update-atmos.py

#  input: .../linkdir/products/version_1_5/netCDF
# output: .../linkdir/products/version_1_5/input4MIPs

echo ${0} "EXIT"
