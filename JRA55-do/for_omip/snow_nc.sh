#!/bin/sh

datahome=../linkdir/products
nchome=../linkdir/products

flin="${datahome}/version_1_5/grads/2022/snow."
flout="${nchome}/version_1_5/netCDF/snow.2022.20220321.nc"
flctl="${nchome}/version_1_5/netCDF/snow.2022.ctl"

##############################
# if mask is written to file, l_mask_out = .true.
# and flibas with valid size must exist

l_mask_out=.false.
flibas="../../data/basin_map.txt"

# for GrADs xdfopen

time_start="01:30z01jan2022"
time_intv="3hr"

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
 l_y_even=.false.,
 num_vars=1,
 num_var_out=1,
 lon_first=0.0d0,delta_lon=1.0d0,nlons=640,l_lon_model=.true.,lon_units="degrees_east",
 lat_first=-90.0d0,delta_lat=0.5d0,nlats=320,l_lat_model=.true.,lat_units="degrees_north",
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
 nrecs_per_year=2920,
 nrecs_out=640,
 l_leap=.true.,
 file_basin="${flibas}",
 file_ctl="${flctl}"
 time_start="${time_start}"
 time_intv="${time_intv}"
 l_put_global_attributes=.true.
/
&nml_vars
 nth_place_tmp=1,
 vname_tmp='prsn'
 vunit_tmp='kg/m2/s',
 vlongname_tmp='Precipitation of water in solid phase'
 vstandardname_tmp='snowfall_flux'
 rconv_tmp=1.0,
 rmin_tmp=-9.99e33,
 rmax_tmp=9.99e33,
 undef_in_tmp=-9.99e33,
 undef_out_tmp=1.e20,
/
&nml_global_attributes
  global_attributes%title="Adjusted snow fall rate of JRA55-do"
  global_attributes%institution="JMA Meteorological Research Institute"
  global_attributes%version="v1.5.0"
  global_attributes%comment="None"
  global_attributes%fill_value="Fill value is 1.e20"
/
EOF
