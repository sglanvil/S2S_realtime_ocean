#!/bin/bash -f

set -e

#item=${1}
#yearst=${2}
#yeared=${3}
#day_st=${4}
#day_ed=${5}

yearst=1973
yeared=2012
day_st=
day_ed=

out_weight=.false.
fcst_org='../linkdir/forcing/jra55c_org_filt'
fcst_latlon='../linkdir/forcing/jra55c_latlon'
file_table='../linkdir/data/red2reg_fill_with_water.d'

################

. ../util/datel_leap.sh

year=${yearst}

while [ ${year} -le ${yeared} ];
do
  echo ${year}
  leap=`isleap ${year}`
  ndayyr=`expr 365 + ${leap}`

  if [ x${day_st} == x ]; then
    i=1
  else
    i=${day_st}
  fi
  if [ x${day_ed} == x ]; then
    iend=${ndayyr}
  else
    iend=${day_ed}
  fi

  echo "year = ${year}  istart = ${i}  iend = ${iend}  ndayyr = ${ndayyr}"

  while [ $i -le $iend ];
  do
    yr=$( nydate $year $i | awk '{print $1 }' )
    mn=$( nydate $year $i | awk '{print $2 }' )
    dy=$( nydate $year $i | awk '{print $3 }' )
 
    yr0=$( printf %04d $yr )
    mn0=$( printf %02d $mn )
    dy0=$( printf %02d $dy )

    yyyy=${yr0}
    yyyymm=${yr0}${mn0}

    if [ ! -e ${fcst_latlon}/${yyyymm} ]; then
      echo "creating ${yyyymm}"
      mkdir ${fcst_latlon}/${yyyymm}
    fi

    for hour in 0 3 6 9 12 15 18 21
    do 
      hh=$( printf %02d ${hour} )
      yyyymmddhh=${yr0}${mn0}${dy0}${hh}

      for item in u10m v10m
      do
        item_weight=${item}'_weight'
        sed -e s%@base_dir_org@%${fcst_org}% \
            -e s%@base_dir_latlon@%${fcst_latlon}% \
            -e s%@yyyymm@%${yyyymm}% \
            -e s%@item@%${item}% \
            -e s%@item_weight@%${item_weight}% \
            -e s%@ext@%${yyyymmddhh}% \
            -e s%@file_table@%${file_table}% \
            -e s%@out_weight@%${out_weight}% \
          namelist.make_red2reg_template > namelist.make_red2reg
        ./make_red2reg
      done
    done

    i=$(( $i + 1 ))

  done

  yearn=`expr ${year} + 1`
  year=${yearn}

done
