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

# old website
#   wget --no-check-certificate --backups=5 https://climate.mri-jma.go.jp/~htsujino/userspace/JRA55-do/repos/cobesst_daily/sst-glb.2019.dat

   wget --user=jra55-do-developer --password='55jraGoGo' --no-check-certificate --backups=5 https://climate.mri-jma.go.jp/~htsujino/JRA55-do/data/repos/cobesst_daily/sst-glb.2019.dat
   wget --user=jra55-do-developer --password='55jraGoGo' --no-check-certificate --backups=5 https://climate.mri-jma.go.jp/~htsujino/JRA55-do/data/repos/cobesst_daily/sst-glb.2020.dat
   wget --user=jra55-do-developer --password='55jraGoGo' --no-check-certificate --backups=5 https://climate.mri-jma.go.jp/~htsujino/JRA55-do/data/repos/cobesst_daily/sst-glb.2021.dat
   wget --user=jra55-do-developer --password='55jraGoGo' --no-check-certificate --backups=5 https://climate.mri-jma.go.jp/~htsujino/JRA55-do/data/repos/cobesst_daily/sst-glb.2022.dat
fi

#-----------------------------------------------------------------------------------------
echo " Decode GRIB and make flat binary -----------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/cobesst
pwd

LOGFILE=$CASEDIR/grib2grads_cobesst_daily.log.$YEARe.$LIDtime 
./grib2grads_cobesst_daily.sh 2021  2022    >& $LOGFILE # HACK: need adjacent year's data (Dec 31, or Jan 1)

#time ./grib2grads_cobesst_daily.sh 2021   2022    >& $LOGFILE # HACK: need adjacent year's data (Dec 31, or Jan 1)

#LOGFILE=$CASEDIR/grib2grads_cobesst_daily.log.$YEARe.$LIDtime ./grib2grads_cobesst_daily.sh 2019   2021    >& $LOGFILE 
#time ./grib2grads_cobesst_daily.sh 2019   2021    >& $LOGFILE

#--- don't need this monthly data ---
# time ./grib2grads_cobesst_daily.sh $YEARs $YEARe  >& $LOGFILE
#  input: DATADIR/cobesst/daily/grib
# output: DATADIR/cobesst/daily/grads

# LOGFILE=$CASEDIR/grib2grads_cobesst_monthly.log.$YEARe.$LID
# time ./grib2grads_cobesst_monthly.sh $YEARs $YEARe  >& $LOGFILE
#  input: DATADIR/cobesst/monthly/grib
# output: DATADIR/cobesst/monthly/grads

# if [ $COMPILE == "TRUE" ] ; then
   # gmake separate_cobesst_monthly
# fi

# LOGFILE=$CASEDIR/make_sepmondata.log.$YEARe.$LID
# time ./make_sepmondata.sh $YEARs $YEARe $MONTHe  >& $LOGFILE
#  input: DATADIR/cobesst/monthly/grads
# output: DATADIR/cobesst/monthly/yyyymm

#-----------------------------------------------------------------------------------------
echo " Create netCDF files used by input4MIPS -----------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

alias wgrib="~/local/bin/wgrib"

cd $HOMEDIR/anl/grd2nc_g_input4mips
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake grd2nc_g
   gmake grd2nc_g_all
fi

cd $HOMEDIR/for_omip
pwd

LOGFILE=$CASEDIR/create_netcdf_cobesst.log.$YEARs.$LID
time ./create_netcdf_cobesst.sh $YEARs $YEARe $DATESTRe  $ODAYe  >& $LOGFILE
#  input: DATADIR/cobesst/daily/grads
# output: DATADIR/products/support/netCDF


echo ${0} "EXIT"
