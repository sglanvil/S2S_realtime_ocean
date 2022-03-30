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
echo "6 Additional adjustment of surface atmospheric variables"
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " Smoothing air temp and spec humidity in marginal sea-ice zones -----------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_tmp10m_iceedge_mon_interannual
fi

LOGFILE=$CASEDIR/calib_tmp10m_iceedge_update_exec_v1_3.log.$LID
time ./calib_tmp10m_iceedge_update_exec_v1_3.sh  $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv tmp10m_iceedge_update.log $CASEDIR/tmp10m_iceedge_update.log.$LID
#  input: .../linkdir/work/jra55fcst_v1_3_prod1_3hr_TL319
# output: .../linkdir/work/jra55fcst_v1_3_prod2_3hr_TL319


#-----------------------------------------------------------------------------------------
echo " Cutting off extremely low temperature around Antarctica ------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_tmp10m_antarc_interannual
fi

LOGFILE=$CASEDIR/calib_tmp10m_antarc_update_exec_v1_3.log.$LID
time ./calib_tmp10m_antarc_update_exec_v1_3.sh  $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv tmp10m_antarc_update.log  $CASEDIR/tmp10m_antarc_update.log.$LID
#  input: .../linkdir/work/jra55fcst_v1_3_prod2_3hr_TL319 (see above)
# output: .../linkdir/work/jra55fcst_v1_3_prod3_3hr_TL319

echo ${0} "EXIT"
