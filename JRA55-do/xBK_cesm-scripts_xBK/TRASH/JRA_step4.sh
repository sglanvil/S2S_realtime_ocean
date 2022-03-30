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
echo "4. Adjustment of downward short wave and long wave radiation fluxes"
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " Adjustment ---------------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_rad_interannual
fi

LOGFILE=$CASEDIR/calib_rad_interannual_update_exec.log.$LID
time ./calib_rad_interannual_update_exec.sh   $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv calib_rad_update_v0_7_*.log $CASEDIR
#  input: DATADIR/ ???
# output: .../inkdir/work/jra55fcst_v7_rad_3hr_TL319r


#-----------------------------------------------------------------------------------------
echo " Map variables from the reduced TL319 grid to normal TL319 grid -------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_product   
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake make_red2reg
fi

LOGFILE=$CASEDIR/red2reg_exec_rad.log.$LID
time ./red2reg_exec_rad.sh $YEARs $YEARe $ODAYs $ODAYe  >& $LOGFILE
#  input: .../linkdir/work/jra55fcst_v0_7_rad_3hr_TL319r (see above)
# output: .../linkdir/work/jra55fcst_v0_7_rad_3hr_TL319
#   note: soft link  jra55fcst_v0_7_rad1_3hr_TL319 -> jra55fcst_v0_7_rad_3hr_TL319


echo ${0} "EXIT"
