extract_jra55
========

This directory contains shell srcipts/Fortran programs to do
 the following operations.

 1. Convert orignal JRA-55 data format from Grib to Direct access binary.
 2. Zonal interpolation from reduced gauss grid to regular lat-lon grid.


Document
--------

 1. Convert orignal JRA55 data from Grib to direct access binary

    NOTE: Edit the following file according to the grib table
    you will use with wgrib command: Default variable name for
    "total precipipation" seems to be different beween
    wgrib 1.8.1.2a (APCP) and 1.8.2 (TPRAT).

    - grib2flatbin_phy2m.sh ! 2D physical quantity monitor
    - grib2flatbin_surf.sh  ! 2D surface monitor
    - grib2flatbin_ice.sh   ! 2D sea ice monitor
 

 2. Zonal interpolation from reduced gauss grid to regular lat-lon grid

   a. Use linear interpolation

     src/rgrid2latlon.F90
     rgrid2latlon_exec.sh
     namelist.rg2latlon_template

   b. No interpolation

     src/rgrid2latlon_nointpol.F90 
        ... Middle point is fill with the western point
     rgrid2latlon_exec_nointpol.sh
     namelist.rg2latlon_nointpol_template

   c. for land-sea mask
     src/rgrid2latlon_mask.F90 
       ... This program uses linear interpolation, 0.5 is treated as land.
     rgrid2latlon_mask.sh
     namelist.rg2latlon_mask


Development
--------

  * Developed at: Oceanographical and Geochemincal Research Department,
                  Meteorological Research Institute,
                  Japan Meteorological Agency
  * Contact: Hiroyuki Tsujino (htsujino@mri-jma.go.jp)
