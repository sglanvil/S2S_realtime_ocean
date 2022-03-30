#!/bin/bash

set -e 

if [ x${3} == x ]; then
   echo "Usage: ${0} start_year end_year creation_date day_end"
   exit
fi

rm -f NAMELIST.MXE
ln -s NAMELIST.MXE.COBESST.ocean_annual NAMELIST.MXE

yearst=${1}
yeared=${2}
creation_date=${3}
day_ed=${4}

. ../util/datel_leap.sh

year=${yearst}

while [ ${year} -le ${yeared} ];
do
  echo ${year}
  leap=`isleap ${year}`
  num_day_year=`expr 365 + ${leap}`
  if [ x${day_ed} == x ]; then
    num_day=${num_day_year}
  else
    num_day=${day_ed}
  fi
  num_data=${num_day}
  echo "num_day = ${num_day}, num_data = ${num_data}"
  num_data_year=${num_day_year}
  echo "num_day_year = ${num_day_year}, num_data_year = ${num_data_year}"
  for item in sst ice
  do
    sed -e s/@year@/${year}/ \
        -e s/@create@/${creation_date}/ \
        -e s/@num_data_year@/${num_data_year}/ \
        -e s/@num_data@/${num_data}/ \
        ${item}_cobe_nc.sh_template > ${item}_cobe_nc.sh
    chmod 755 ./${item}_cobe_nc.sh
    ./${item}_cobe_nc.sh
  done
  yearn=`expr ${year} + 1`
  year=${yearn}
done

rm -f NAMELIST.MXE

exit 0
