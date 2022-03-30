#!/bin/sh

flin="../linkdir/data/jra55_ocean_mask.gd"
flout="/work116/htsujino/SURF_FLUX/forcing/OMIP_DATA/JRA55_v0.7/jra55_mask_sea.31May2016.nc"
flctl="/work116/htsujino/SURF_FLUX/forcing/OMIP_DATA/JRA55_v0.7/jra55_mask_sea.31May2016.ctl"

##############################
# if mask is written to file, l_mask_out = .true.
# and flibas with valid size must exist

l_mask_out=.false.
flibas="../../data/basin_map.txt"

# for GrADs xdfopen

time_start="00:00z01jan1958"
time_intv="1yr"

./grd2nc_g_revised<<EOF
&nml_grd2nc_g
 file_in="${flin}",
 file_out="${flout}",
 tuw="u"
 l_append_ext=.false.,
 cext="no",
 l_one_data=.true.,
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
 i_ref_year=1958,
 i_ref_month=1,
 i_ref_day=1,
 i_ref_hour=0,
 i_ref_minute=0,
 i_ref_second=0,
 first_data_relative_to_ref=0.0d0,
 ibyear=1958,
 ieyear=1958,
 intv_indx=1,
 nrecs_per_year=1,
 nrecs_out=1,
 l_leap=.true.,
 file_basin="${flibas}",
 file_ctl="${flctl}"
 time_start="${time_start}"
 time_intv="${time_intv}"
 l_put_global_attributes=.true.
/
&nml_vars
 nth_place_tmp=1,
 vname_tmp='sea',
 vunit_tmp='1',
 vlongname_tmp='Sea area fraction with Sea(=1) and other(=0)',
 vstandardname_tmp='sea_area_fraction',
 rconv_tmp=1.0,
 rmin_tmp=-9.99e33,
 rmax_tmp=9.99e33,
 undef_in_tmp=-9.99e33,
 undef_out_tmp=-9.99e33,
/
&nml_global_attributes
  global_attributes%title="Land-Sea mask of JRA55"
  global_attributes%institution="JMA Meteorological Research Institute"
  global_attributes%version="v0.7"
  global_attributes%comment="Inland seas, lakes, and ponds are set to land (=0)"
  global_attributes%fill_value="Fill value is -9.99e33"
/
EOF
