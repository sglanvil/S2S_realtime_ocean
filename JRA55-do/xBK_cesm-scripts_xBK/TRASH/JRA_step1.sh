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
echo "1. Acquire JRA-55 forecast data and pre-process it"
echo "==========================================================================="

echo " Download JRA55 forecast data ---------------------------------------------"
if [ $DOWNLOAD != "TRUE" ] ; then
   echo "Not downloading data -- assume it has already been acquired"
else
   DATA_SRC_DIR=/glade/collections/rda/data/ds628.8
#  for MONTH in 01 02 03 04 05 06 07 08 09 10 11 12 ; do
   for MONTH in                   07 08 09 10 11 12 ; do
      DATE_DIR=${YEARs}${MONTH}
   #  for FCST_DIR in fcst_phy2m ice fcst_surf fcst_phyland ; do  -- don't need phyland or ice ?
      for FCST_DIR in fcst_phy2m ice fcst_surf ; do
         cd $DATADIR/forcing/$FCST_DIR
         if [ ! -d $DATE_DIR ]; then mkdir $DATE_DIR ; fi
         cp -rpn $DATA_SRC_DIR/$FCST_DIR/$DATE_DIR/*   $DATE_DIR
   #     echo $(date +%y%m%d-%H%M%S)  lftp mirror -c  $DATADIR/$FCST_DIR/$DATE_DIR
   #     lftp -c "open -u jra06235,2rXw3TSf ds.data.jma.go.jp ; cd /JRA-55/Hist/Daily/$FCST_DIR ; mirror -c -P 3 $DATE_DIR ; exit "
   #     lftp -c "open -u jra06235,2rXw3TSf ds.data.jma.go.jp ; cd /JRA-55/Hist/Daily/$FCST_DIR/$DATE_DIR ; mget -c * "  -- too many processes
      done
   done
fi

#-----------------------------------------------------------------------------------------
echo " Decode GRIB and make flat binary -----------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/extract_jra55
pwd

LOGFILE=$CASEDIR/process_year_last.log.$YEARe.$LID
time ./process_year_last.sh $YEARe $MONTHe $DAYe  >& $LOGFILE
#  input: DATADIR/forcing/fcst_phy2m,fcst_surf
# output: DATADIR/work/jra55fcst_3hr_TL319r

#-----------------------------------------------------------------------------------------
echo " Apply zonal 1-2-1 filter to winds ----------------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_calib
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake filter_wind_interannual
fi

LOGFILE=$CASEDIR/filter_wind_interannual_latest_exec.log.$YEARs.$LID
time ./filter_wind_interannual_latest_exec.sh $YEARs $MONTHs $DAYs $YEARp $MONTHp $DAYp  >& $LOGFILE
#  input: DATADIR/work/jra55fcst_3hr_TL319r
# output: DATADIR/work/jra55fcst_filt_3hr_TL319  <- (link) DATADIR/work/jra55fcst_3hr_TL319

#-----------------------------------------------------------------------------------------
echo " Regrid from reduced TL319 to normal TL319 ---------------------------------"
echo "tStamp: $(date +%y%m%d-%H%M%S)"
#-----------------------------------------------------------------------------------------

cd $HOMEDIR/jra55_org_grid_product
pwd

if [ $COMPILE == "TRUE" ] ; then
   gmake make_red2reg
fi

echo "#--- regrid everything except wind ---"
LOGFILE=$CASEDIR/red2reg_exec_raw_v1_0.log.$YEARs.$LID
time           ./red2reg_exec_raw_v1_0.sh  $YEARs $YEARe $ODAYs $ODAYe >& $LOGFILE
echo "#--- regrid filtered wind ---"
LOGFILE=$CASEDIR/red2reg_exec_raw_v1_0_wind.log.$YEARs.$LID
time           ./red2reg_exec_raw_v1_0_wind.sh  $YEARs $YEARe $ODAYs $ODAYe >& $LOGFILE
#  input: DATADIR/work/jra55fcst_3hr_TL319r
#  input: DATADIR/work/jra55fcst_filt_3hr_TL319r
# output: DATADIR/work/jra55fcst_filt_3hr_TL319


# link: DATADIR/work/jra55fcst_3hr_TL319 -> DATADIR/work/jra55fcst_filt_3hr_TL319 (only wind is filtered)

echo ${0} "EXIT"
