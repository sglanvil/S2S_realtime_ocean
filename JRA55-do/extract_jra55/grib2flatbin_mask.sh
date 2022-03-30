#!/bin/bash

set -e 

#rgdir=/mri-data/jra-55/Const
orgdir=../linkdir/work/const
newdir=../linkdir/work/const

#wgrib -s ${orgdir}/TL319.grib | egrep '(:LAND:)' | wgrib -i -bin -ieee -nh ${orgdir}/TL319.grib -o ${newdir}/TL319.mask
wgrib -s ${orgdir}/TL319.grib | egrep '(:LAND:)' | wgrib -i -bin -nh ${orgdir}/TL319.grib -o ${newdir}/TL319.mask
