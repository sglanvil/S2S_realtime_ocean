#!/bin/bash

set -e

if [ x${6} == x ]; then
   echo "Usage: ${0} yrst mnst dyst yred mned dyed"
   exit
fi

yrst=${1}
mnst=${2}
dyst=${3}
yred=${4}
mned=${5}
dyed=${6}

orgdir=../linkdir/work/jra55fcst_3hr_TL319r
newdir=../linkdir/work/jra55fcst_v1_2_3hr_tmp2m_TL319r

year=${yrst}
while [ ${year} -le ${yred} ];
do
  for mon in `seq -f "%02g" 1 12`
  do
    if [ ! -e ${newdir}/${year}${mon} ]; then
      echo "creating ${year}${mon}"
      mkdir -p ${newdir}/${year}${mon}
    fi
  done
  year=`expr ${year} + 1`
done

rm -f namelist.calibsat_ocn_ice

sed -e s%@yrst@%${yrst}% \
    -e s%@mnst@%${mnst}% \
    -e s%@dyst@%${dyst}% \
    -e s%@yred@%${yred}% \
    -e s%@mned@%${mned}% \
    -e s%@dyed@%${dyed}% \
    namelist.calibsat_ocn_ice_monthly_v1_2_latest_template > namelist.calibsat_ocn_ice

./calib_tmp2m_ocn_ice_interannual > calib_v1_2_tmp2m_latest.log