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
echo "7 Applying globally constant factors to downward fluxes"
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " Downward Radiation -------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_rad_interannual
fi

LOGFILE=$CASEDIR/calib_rad_const_update_exec_v1_3.log.$LID
time ./calib_rad_const_update_exec.sh  v1_3 $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv calib_rad_const_v1_3_update.log $CASEDIR/calib_rad_const_v1_3_update.log.$LID
#  input: .../linkdir/work/jra55fcst_v0_7_rad1_3hr_TL319
# output: .../linkdir/work/jra55fcst_v1_3_rad2_3hr_TL319

#-----------------------------------------------------------------------------------------
echo " Precipitation ------------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_precip_interannual
fi

LOGFILE=$CASEDIR/calib_prcp_snow_const_update_exec_v1_3.log.$LID
time ./calib_prcp_snow_const_update_exec.sh  v1_3 $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv calib_prcp_const_v1_3_update.log $CASEDIR/calib_prcp_const_v1_3_update.log.$LID
mv calib_snow_const_v1_3_update.log $CASEDIR/calib_snow_const_v1_3_update.log.$LID
#  input: .../linkdir/work/jra55fcst_v1_2_prcp_3hr_TL319
# output: .../linkdir/work/jra55fcst_v1_3_prcp2_3hr_TL319

#-----------------------------------------------------------------------------------------
echo " Generate rain data -------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------
# CREATES  .../linkdir/products/version_1_5/grads/YYYY  FOR WHOLE YEAR

cd $HOMEDIR/jra55_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake precip_minus_snow_interannual
fi

LOGFILE=$CASEDIR/create_rain_update_log.$LID
#ime ./create_rain_update.sh v1_5 $YEARs $MONTHs $DAYs   $YEARe $MONTHe $DAYe  >& $LOGFILE
time ./create_rain_update.sh v1_5 $YEARs   1       1     $YEARp $MONTHp $DAYp  >& $LOGFILE
mv create_rain-v1_5_update.log $CASEDIR/create_rain-v1_5_update.log.$LID
#  input: .../linkdir/work/jra55fcst_v1_3_prcp2_3hr_TL319
# output: .../linkdir/work/version_1_5/grads/YYYY 

echo ${0} "EXIT"
