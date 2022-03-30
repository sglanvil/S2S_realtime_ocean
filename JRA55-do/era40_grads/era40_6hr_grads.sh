#!/bin/bash

set -e

yearst=${1}
yeared=${2}
var_name=${3}
var_name_out=${4}

################

. ../util/datel_leap.sh

year=${yearst}

while [ ${year} -le ${yeared} ];
do

  leap=`isleap ${year}`
  ndayyr=`expr 365 + ${leap}`

  yearn=`expr ${year} + 1`

  echo "year = ${year}  year_next = ${yearn}"

  sed -e s%@nyear@%${year}% \
      -e s%@var_name@%${var_name}% \
      -e s%@var_name_out@%${var_name_out}% \
      namelist.era40_org2grads_template > namelist.era40_org2grads

  ./nc2grads_era40_6hourly

  year=${yearn}

done