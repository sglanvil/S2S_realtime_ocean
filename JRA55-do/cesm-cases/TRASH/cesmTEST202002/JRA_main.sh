#!/usr/bin/env sh
set -e

# issues with conda...
# https://stackoverflow.com/questions/55507519/python-activate-conda-env-through-shell-script
# conda init bash
# conda activate mypy38

CASEDIR=$(pwd)               # include file is here & put output here, if possible
echo ${0}: $CASEDIR
source ${CASEDIR}/JRA_include.sh  # input parameter fil

if [ $DO_STEP0 == "TRUE" ] ; then
   echo "${0}: Step 0  execute..."
   sh $SCRIPTDIR/JRA_step0.sh $CASEDIR  >& $CASEDIR/JRA_step0.log
fi

if [ $DO_STEP1 == "TRUE" ] ; then
   echo "${0}: Step 1  execute..."
   sh $SCRIPTDIR/JRA_step1.sh $CASEDIR  >& $CASEDIR/JRA_step1.log
fi

if [ $DO_STEP2 == "TRUE" ] ; then
   echo "${0}: Step 2  execute..."
   sh $SCRIPTDIR/JRA_step2.sh $CASEDIR  >& $CASEDIR/JRA_step2.log
fi

if [ $DO_STEP3 == "TRUE" ] ; then
   echo "${0}: Step 3  execute..."
   sh $SCRIPTDIR/JRA_step3.sh $CASEDIR  >& $CASEDIR/JRA_step3.log
fi

if [ $DO_STEP4 == "TRUE" ] ; then
   echo "${0}: Step 4  execute..."
   sh $SCRIPTDIR/JRA_step4.sh $CASEDIR  >& $CASEDIR/JRA_step4.log
fi

if [ $DO_STEP5 == "TRUE" ] ; then
   echo "${0}: Step 5  execute..."
   sh $SCRIPTDIR/JRA_step5.sh $CASEDIR  >& $CASEDIR/JRA_step5.log
fi

if [ $DO_STEP6 == "TRUE" ] ; then
   echo "${0}: Step 6  execute..."
   sh $SCRIPTDIR/JRA_step6.sh $CASEDIR  >& $CASEDIR/JRA_step6.log
fi

if [ $DO_STEP7 == "TRUE" ] ; then
   echo "${0}: Step 7  execute..."
   sh $SCRIPTDIR/JRA_step7.sh $CASEDIR  >& $CASEDIR/JRA_step7.log
fi

if [ $DO_STEP8 == "TRUE" ] ; then
   echo "${0}: Step 8  execute..."
   sh $SCRIPTDIR/JRA_step8.sh $CASEDIR  >& $CASEDIR/JRA_step8.log
fi

#conda deactivate

echo " -------------- DONE ----------------- "
