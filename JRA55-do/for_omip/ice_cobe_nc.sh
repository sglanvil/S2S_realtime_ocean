#!/bin/sh

set -e

orgdir=../linkdir/COBESST/daily/grads
newdir=../linkdir/products

flin="${orgdir}/ice-glb."
flout="${newdir}/support/netCDF/ice.COBESST.2022.20220321.nc"
flctl="${newdir}/support/netCDF/ice.COBESST.2022.ctl"

##############################
# if mask is written to file, l_mask_out = .true.
# and flibas with valid size must exist

l_mask_out=.false.
flibas="dummy_basin_map.txt"

# for GrADs xdfopen

time_start="01jan2022"
time_intv="1day"

./grd2nc_g_input4mips<<EOF
&nml_grd2nc_g
 file_in="${flin}",
 file_out="${flout}",
 tuw="u"
 l_append_ext=.false.,
 cext="no",
 l_one_data=.false.,
 l_mask_out=${l_mask_out},
 l_space_2d=.true.,
 l_x_even=.true.,
 l_y_even=.true.,
 num_vars=1,
 num_var_out=1,
 lon_first=0.5d0,delta_lon=1.0d0,nlons=360,l_lon_model=.true.,lon_units="degrees_east",
 lat_first=-89.5d0,delta_lat=1.0d0,nlats=180,l_lat_model=.true.,lat_units="degrees_north",
 zlev=0.0d0,,,
 nlvls=1,
 l_lev_model=.false.,
 lvl_units="m",
 i_ref_year=1900,
 i_ref_month=1,
 i_ref_day=1,
 i_ref_hour=0,
 i_ref_minute=0,
 i_ref_second=0,
 first_data_relative_to_ref=0.5d0,
 ibyear=2022,
 ieyear=2022,
 intv_indx=3,
 nrecs_per_year=365,
 nrecs_out=080,
 l_leap=.true.,
 file_basin="${flibas}",
 file_ctl="${flctl}"
 time_start="${time_start}"
 time_intv="${time_intv}"
 l_put_global_attributes=.true.
/
&nml_vars
 nth_place_tmp=1,
 vname_tmp='siconco'
 vunit_tmp='%',
 vlongname_tmp='ICE Area Fraction in % (1 for ice, 0 for no ice.)'
 vstandardname_tmp='ice_area_fraction'
 rconv_tmp=100.0,
 rmin_tmp=-9.99e33,
 rmax_tmp=9.99e33,
 undef_in_tmp=9.999e20,
 undef_out_tmp=1.e20,
/
&nml_global_attributes
  global_attributes%title="ICE Area Fraction of COBESST"
  global_attributes%institution="JMA Meteorological Research Institute"
  global_attributes%version="v1.3.1"
  global_attributes%comment="Raw data of COBESST"
  global_attributes%fill_value="Fill value is 1.e20"
/
EOF
