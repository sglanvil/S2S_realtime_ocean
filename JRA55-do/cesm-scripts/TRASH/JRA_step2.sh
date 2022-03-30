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
echo "2. Update COBE SST data"
echo "==========================================================================="

#-----------------------------------------------------------------------------------------
echo " Download COBE-SST data ---------------------------------------------------"
#-----------------------------------------------------------------------------------------

if [ $DOWNLOAD != "TRUE" ] ; then
   echo "No data downloading."
else
   cd $DATADIR/COBESST/daily/grib 
   pwd
   wget --no-check-certificate https://climate.mri-jma.go.jp/~htsujino/userspace/JRA55-do/repos/cobesst_daily/sst-glb.2020.dat
#  ?? don't need monthly data ??
   cd $DATADIR/COBESST/monthly/grib 
   pwd
   wget --no-check-certificate https://climate.mri-jma.go.jp/~htsujino/userspace/JRA55-do/repos/cobesst_monthly/sst-glb.2020.dat
fi

#-----------------------------------------------------------------------------------------
echo " Decode GRIB and make flat binary -----------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/cobesst
pwd

LOGFILE=$CASEDIR/grib2grads_cobesst_daily.log.$YEARe.$LID
time ./grib2grads_cobesst_daily.sh $YEARs $YEARe  >& $LOGFILE
#  input: DATADIR/cobesst/daily/grib
# output: DATADIR/cobesst/daily/grads

LOGFILE=$CASEDIR/grib2grads_cobesst_monthly.log.$YEARe.$LID
time ./grib2grads_cobesst_monthly.sh $YEARs $YEARe  >& $LOGFILE
#  input: DATADIR/cobesst/monthly/grib
# output: DATADIR/cobesst/monthly/grads

if [ $COMPILE == "TRUE" ] ; then
   gmake separate_monthly_cobesst
fi

LOGFILE=$CASEDIR/make_sepmondata.log.$YEARe.$LID
time ./make_sepmondata.sh $YEARs $YEARe $MONTHe  >& $LOGFILE
#  input: DATADIR/cobesst/monthly/grads
# output: DATADIR/cobesst/monthly/yyyymm

#-----------------------------------------------------------------------------------------
echo " Create netCDF files used by input4MIPS -----------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/anl/grd2nc_g_input4mips
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake grid2nc_g
fi

cd $HOMEDIR/for_omip
pwd

LOGFILE=$CASEDIR/create_netcdf_cobesst.log.$YEARs.$LID
time ./create_netcdf_cobesst.sh $YEARs $YEARe $DATESTRe  $ODAYe  >& $LOGFILE
#  input: DATADIR/cobesst/monthly/grads
# output: DATADIR/products/support/netCDF


echo ${0} "EXIT"
