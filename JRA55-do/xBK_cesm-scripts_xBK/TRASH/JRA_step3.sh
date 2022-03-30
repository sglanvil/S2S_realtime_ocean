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
echo "3. Adjustment of surface atmospheric variables"
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " Air temperature ----------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_calib
pwd

LOGFILE=$CASEDIR/calib_tmp2m_v1_2_interannual_latest_exec.log.$LID
time ./calib_tmp2m_v1_2_interannual_latest_exec.sh $YEARs $MONTHs $DAYs   $YEARp $MONTHp $DAYp  >& $LOGFILE
mv calib_v1_2_tmp2m_latest.log $CASEDIR/calib_v1_2_tmp2m_latest.log.$LID
#  input: DATADIR/ ???
# output: .../linkdir/work/jra55fcst_v1_2_3hr_tmp2m_TL319r/<yyyymm>/

#-----------------------------------------------------------------------------------------
echo " Specific humidity --------------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_calib
pwd

LOGFILE=$CASEDIR/calib_sph2m_v1_2_interannual_latest_exec.log.$LID
time ./calib_sph2m_v1_2_interannual_latest_exec.sh $YEARs $MONTHs $DAYs  $YEARp $MONTHp $DAYp  >& $LOGFILE
mv calib_v1_2_sph2m_latest.log $CASEDIR/calib_v1_2_sph2m_latest.log.$LID
#  input: DATADIR/ ???
# output: .../linkdir/work/jra55fcst_v1_2_3hr_sph2m_TL319r/<yyyymm>/

#-----------------------------------------------------------------------------------------
echo " Compute equivalent neutral wind ------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_anl   
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake diag_neutral_wind
fi

LOGFILE=$CASEDIR/jra55fcst_filt_v1_2tq_neutral_wind_exec.log.$LID
time ./jra55fcst_filt_v1_2tq_neutral_wind_exec.sh $YEARs $YEARe $ODAYs $ODAYe  >& $LOGFILE
#  input: .../linkdir/work/jra55fcst_v1_2_3hr_tmp2m_TL319r/<yyyymm>/
#  input: .../linkdir/work/jra55fcst_v1_2_3hr_sph2m_TL319r/<yyyymm>/
#  input: .../linkdir/COBESST/daily/grads/
# output: .../linkdir/work/jra55fcst_filt_v1_2tq_3hr_TL319r

#-----------------------------------------------------------------------------------------
echo " Adjustment of the equivalent neutral wind --------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake calib_wind_offset_interannual
fi

LOGFILE=$CASEDIR/calib_wind_v1_3_interannual_latest_exec.log.$LID
time ./calib_wind_v1_3_interannual_latest_exec.sh $YEARs $MONTHs $DAYs $YEARp $MONTHp $DAYp >& $LOGFILE
mv calib_wind_v1_3_latest.log $CASEDIR/calib_wind_v1_3_latest.log.$LID
#  input: .../linkdir/work/jra55fcst_filt_v1_2tq_3hr_TL319r ??
# output: .../linkdir/work/jra55fcst_filt_v1_3_3hr_wind_TL319r

#-----------------------------------------------------------------------------------------
echo " Shift the data to 10m: actual wind, temperature, specific humidity -------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_anl   
pwd

LOGFILE=$CASEDIR/jra55fcst_filt_v1_3_actual_wind_exec.log.$LID
time ./jra55fcst_filt_v1_3_actual_wind_exec.sh $YEARs $YEARe $ODAYs $ODAYe  >& $LOGFILE
#  input: .../linkdir/COBESST/daily/grads/
#  input: 
# output: .../linkdir/work/jra55fcst_v1_3_prod1_3hr_TL319r

#-----------------------------------------------------------------------------------------
echo " Map variables from the reduced TL319 grid to the normal TL319 grid -------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_product   
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake make_red2reg
fi

LOGFILE=$CASEDIR/red2reg_exec_v1_3.log.$LID
time ./red2reg_exec_v1_3.sh $YEARs $YEARe $ODAYs $ODAYe  >& $LOGFILE
mv   wind_v1_3.$YEARs-${YEARe}.log    $CASEDIR/wind_v1_3.$YEARs-${YEARe}.log.$LID
mv tmpsph_v1_3.$YEARs-${YEARe}.log $CASEDIR/tempsph_v1_3.$YEARs-${YEARe}.log.$LID
#  input: .../linkdir/work/jra55fcst_v1_3_prod1_3hr_TL319r
# output: .../linkdir/work/jra55fcst_v1_3_prod1_3hr_TL319


echo ${0} "EXIT"
