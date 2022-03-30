#!/usr/bin/env sh
#===============================================================================
# Purpose:
#
# Notes: 
# 
# History:
# o 2020 Oct, B. Kauffman, first version
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
   touch $CASEDIR/do_step0.$LID
   sh $SCRIPTDIR/JRA_step0.sh $LID $CASEDIR  >& $CASEDIR/JRA_step0.log.$LID
else
   echo "${0}: Step 0  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 1  $LID"
if [ $DO_STEP1 == "TRUE" ] ; then
   echo "${0}: Step 1  execute..."
   touch $CASEDIR/do_step1.$LID
   sh $SCRIPTDIR/JRA_step1.sh $LID $CASEDIR  >& $CASEDIR/JRA_step1.log.$LID
else
   echo "${0}: Step 1  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 2  $LID"
if [ $DO_STEP2 == "TRUE" ] ; then
   echo "${0}: Step 2  execute..."
   touch $CASEDIR/do_step2.$LID
   sh $SCRIPTDIR/JRA_step2.sh $LID $CASEDIR  >& $CASEDIR/JRA_step2.log.$LID
else
   echo "${0}: Step 2  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 3  $LID"
if [ $DO_STEP3 == "TRUE" ] ; then
   echo "${0}: Step 3  execute..."
   touch $CASEDIR/do_step3.$LID
   sh $SCRIPTDIR/JRA_step3.sh $LID $CASEDIR  >& $CASEDIR/JRA_step3.log.$LID
else
   echo "${0}: Step 3  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 4  $LID"
if [ $DO_STEP4 == "TRUE" ] ; then
   echo "${0}: Step 4  execute..."
   touch $CASEDIR/do_step4.$LID
   sh $SCRIPTDIR/JRA_step4.sh $LID $CASEDIR  >& $CASEDIR/JRA_step4.log.$LID
else
   echo "${0}: Step 4  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 5  $LID"
if [ $DO_STEP5 == "TRUE" ] ; then
   echo "${0}: Step 5  execute..."
   touch $CASEDIR/do_step5.$LID
   sh $SCRIPTDIR/JRA_step5.sh $LID $CASEDIR  >& $CASEDIR/JRA_step5.log.$LID
else
   echo "${0}: Step 5  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 6  $LID"
if [ $DO_STEP6 == "TRUE" ] ; then
   echo "${0}: Step 6  execute..."
   touch $CASEDIR/do_step6.$LID
   sh $SCRIPTDIR/JRA_step6.sh $LID $CASEDIR  >& $CASEDIR/JRA_step6.log.$LID
else
   echo "${0}: Step 6  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 7  $LID"
if [ $DO_STEP7 == "TRUE" ] ; then
   echo "${0}: Step 7  execute..."
   touch $CASEDIR/do_step7.$LID
   sh $SCRIPTDIR/JRA_step7.sh $LID $CASEDIR  >& $CASEDIR/JRA_step7.log.$LID
else
   echo "${0}: Step 7  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: Step 8  $LID"
if [ $DO_STEP8 == "TRUE" ] ; then
   echo "${0}: Step 8  execute..."
   touch $CASEDIR/do_step8.$LID
   sh $SCRIPTDIR/JRA_step8.sh $LID $CASEDIR  >& $CASEDIR/JRA_step8.log.$LID
else
   echo "${0}: Step 8  NOT executed"
fi

LID=$(date +%y%m%d-%H%M%S)   # log ID / time-stamp
echo "${0}: DONE.   $LID"
