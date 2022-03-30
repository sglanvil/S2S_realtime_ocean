#!/usr/bin/env sh
##!/bin/bash

set -e

yearst=${1}
yeared=${2}

cobesst_org=../linkdir/COBESST/daily/grib
cobesst_dir=../linkdir/COBESST/daily

alias wgrib=/glade/u/home/ssfcst/local/bin/wgrib #BK: hack until $PATH mod works

################

year=${yearst}

while [ ${year} -le ${yeared} ];
do
  echo ${year}
# echo DEBUGA
  wgrib -s ${cobesst_org}/sst-glb.${year}.dat | egrep '(:WTMP:)' 

  wgrib -s ${cobesst_org}/sst-glb.${year}.dat | egrep '(:WTMP:)' | wgrib -i -nh -ieee ${cobesst_org}/sst-glb.${year}.dat -o ${cobesst_dir}/grads/sst-glb.${year}

# echo DEBUGB
# echo wgrib -s ${cobesst_org}/sst-glb.${year}.dat 2> ${cobesst_dir}/stderr.${year}.txt | egrep '(:ICEC:)' | wgrib -i -nh -ieee ${cobesst_org}/sst-glb.${year}.dat -o ${cobesst_dir}/grads/ice-glb.${year}

  wgrib -s ${cobesst_org}/sst-glb.${year}.dat 2> ${cobesst_dir}/stderr.${year}.txt | egrep '(:ICEC:)' | wgrib -i -nh -ieee ${cobesst_org}/sst-glb.${year}.dat -o ${cobesst_dir}/grads/ice-glb.${year}

  yearn=`expr ${year} + 1`
  year=${yearn}
done
