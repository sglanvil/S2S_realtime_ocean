#!/usr/bin/env sh
#===============================================================================
# Purpose:
#   Automate the running of all steps of Hiroyuki Tsujino's JRA55-do scripts
#   in one call -- all steps as needed to create CESM datm input data files for
#   forcing an ocean spinup run.  
#
#   These scripts have a one-to-one correspondence to the steps described in
#   the JRA55-do github code.  See:
#   https://github.com/HiroyukiTsujino/JRA55-do/wiki/How-to-Update-to-the-latest
#   https://github.com/HiroyukiTsujino/JRA55-do
#
# Notes: 
# o BK: not sure why I can't add ~/local/bin to $PATH so ~/local/bin/wgrib 
#   is in search path.  Until then, this hack is found in several subscripts...
#   alias wgrib=/glade/u/home/ssfcst/local/bin/wgrib
# o step8 requires mypy37 python envirionment before running this script...
#   casper> conda activate mypy38 
# o the purpose of touch $DATADIR/timestamp_stepN
#   is that it can be used to identify files created by a given step via
#   unix> find . -newer timestamp_stepN
# 
# History:
# o 2020 Oct, B. Kauffman, first version
# o 2021 Feb, B. Kauffman, successfully runs all steps in one call
#===============================================================================

set -e   # trap errors
#set -v   # set echo on

#trap '[[ $BASH_COMMAND != echo* ]] && $BASH_COMMAND' DEBUG
#-------------------------------------------------------------------------------
CASEDIR=$(pwd)               # include file is here & put output here, if possible

echo ${0}: $CASEDIR
echo ${0}: $LID
source ${CASEDIR}/JRA_include.sh  # input parameter file

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 0  $LID"
if [ $DO_STEP0 == "TRUE" ] ; then
   echo "${0}: Step 0  execute..."
   touch $DATADIR/timestamp_step0
   touch $CASEDIR/timestamp_step0.$LID
   sh $SCRIPTDIR/JRA_step0.sh $LID $CASEDIR  >& $CASEDIR/JRA_step0.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step0
else
   echo "${0}: Step 0  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 1  $LID"
if [ $DO_STEP1 == "TRUE" ] ; then
   echo "${0}: Step 1  execute..."
   touch $DATADIR/timestamp_step1
   touch $CASEDIR/timestamp_step1.$LID
   sh $SCRIPTDIR/JRA_step1.sh $LID $CASEDIR  >& $CASEDIR/JRA_step1.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step1
else
   echo "${0}: Step 1  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 2  $LID"
if [ $DO_STEP2 == "TRUE" ] ; then
   echo "${0}: Step 2  execute..."
   touch $DATADIR/timestamp_step2
   touch $CASEDIR/timestamp_step2.$LID
   sh $SCRIPTDIR/JRA_step2.sh $LID $CASEDIR  >& $CASEDIR/JRA_step2.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step2
else
   echo "${0}: Step 2  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 3  $LID"
if [ $DO_STEP3 == "TRUE" ] ; then
   echo "${0}: Step 3  execute..."
   touch $DATADIR/timestamp_step3
   touch $CASEDIR/timestamp_step3.$LID
   sh $SCRIPTDIR/JRA_step3.sh $LID $CASEDIR  >& $CASEDIR/JRA_step3.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step3
else
   echo "${0}: Step 3  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 4  $LID"
if [ $DO_STEP4 == "TRUE" ] ; then
   echo "${0}: Step 4  execute..."
   touch $DATADIR/timestamp_step4
   touch $CASEDIR/timestamp_step4.$LID
   sh $SCRIPTDIR/JRA_step4.sh $LID $CASEDIR  >& $CASEDIR/JRA_step4.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step4
else
   echo "${0}: Step 4  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 5  $LID"
if [ $DO_STEP5 == "TRUE" ] ; then
   echo "${0}: Step 5  execute..."
   touch $DATADIR/timestamp_step5
   touch $CASEDIR/timestamp_step5.$LID
   sh $SCRIPTDIR/JRA_step5.sh $LID $CASEDIR  >& $CASEDIR/JRA_step5.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step5
else
   echo "${0}: Step 5  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 6  $LID"
if [ $DO_STEP6 == "TRUE" ] ; then
   echo "${0}: Step 6  execute..."
   touch $DATADIR/timestamp_step6
   touch $CASEDIR/timestamp_step6.$LID
   sh $SCRIPTDIR/JRA_step6.sh $LID $CASEDIR  >& $CASEDIR/JRA_step6.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step6
else
   echo "${0}: Step 6  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 7  $LID"
if [ $DO_STEP7 == "TRUE" ] ; then
   echo "${0}: Step 7  execute..."
   touch $DATADIR/timestamp_step7
   touch $CASEDIR/timestamp_step7.$LID
   sh $SCRIPTDIR/JRA_step7.sh $LID $CASEDIR  >& $CASEDIR/JRA_step7.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step7
else
   echo "${0}: Step 7  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 8  $LID"
if [ $DO_STEP8 == "TRUE" ] ; then
   echo "${0}: Step 8  execute..."
   touch $DATADIR/timestamp_step8
   touch $CASEDIR/timestamp_step8.$LID
   sh $SCRIPTDIR/JRA_step8.sh $LID $CASEDIR  >& $CASEDIR/JRA_step8.log.$LID
   find $DATADIR -newer $DATADIR/timestamp_step8
else
   echo "${0}: Step 8  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: DONE.   $LID"
