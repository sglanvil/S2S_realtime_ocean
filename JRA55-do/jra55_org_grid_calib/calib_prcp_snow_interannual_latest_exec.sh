#!/bin/bash -f

set -e

rm -f namelist.calibpcp

for item in prcp snow
do
  for period in 2016_present
  do
    sed -e s%@item@%${item}% \
        namelist.calibpcp.monthly_v7_${period}_template > namelist.calibpcp
    ./calib_precip_interannual > calib_${item}_${period}.log
  done
done