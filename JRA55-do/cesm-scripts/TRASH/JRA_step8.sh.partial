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
echo " Intermediate netCDF data -------------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/for_omip
pwd

LOGFILE=$CASEDIR/create_netcdf_v1_5.$LID
time ./create_netcdf_v1_5.sh  $YEARs $YEARe $DATESTRc $ODAYe >& $LOGFILE
#  input: ?? 
# output: .../linkdir/products/version_1_5/netCDF

#-----------------------------------------------------------------------------------------
echo " CMORized files for input4MIPs---------------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/for_omip_cmor/MRI-JMA-JRA55-do-1-5-0 
pwd

echo "TBD"

#  input: .../linkdir/products/version_1_5/netCDF
# output: .../linkdir/products/version_1_5/input4MIPs

echo ${0} "EXIT"
