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
echo "5. Adjustment of precipitation fluxes"
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " Adjustment ---------------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_precip_interannual
fi

LOGFILE=$CASEDIR/calib_prcp_snow_interannual_update_exec_v1_2.log.$LID
time ./calib_prcp_snow_interannual_update_exec_v1_2.sh   $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv calib_v1_2_prcp_update.log $CASEDIR
mv calib_v1_2_snow_update.log $CASEDIR
#  input: DATADIR/ ???
# output: .../linkdir/work/jra55fcst_v1_2_prcp_3hr_TL319r


#-----------------------------------------------------------------------------------------
echo " Map variables from reduced TL319 grid to normal TL319 grid -------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_product   
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake make_red2reg
fi

LOGFILE=$CASEDIR/red2reg_exec_precip_v1_2.log.$LID
time ./red2reg_exec_precip_v1_2.sh   $YEARs $YEARe $ODAYs $ODAYe  >& $LOGFILE
#  input: .../linkdir/work/jra55fcst_v1_2_prcp_3hr_TL319r (see above)
# output: .../linkdir/work/jra55fcst_v1_2_prcp_3hr_TL319

echo ${0} "EXIT"
