#!/usr/bin/env sh

set -v   # set echo on

DATADIR=/glade/campaign/cesm/development/cross-wg/S2S/JRA55_data # work dir for input, output, intermediate data
HOMEDIR=/glade/u/home/ssfcst/JRA55-do                # root dir for all JRA55-do scripts (repo root dir)
SCRIPTDIR=/glade/u/home/ssfcst/JRA55-do/cesm-scripts # where the CESM wrapper scripts are

YEARs=2021    # start date: year 
MONTHs=1      # start date: month 
DAYs=1        # start date: day of month
ODAYs=1       # start date: ordinal day (day in year)

YEARe=2021    # end date: year 
MONTHe=3      # end date: month of year
DAYe=20       # end date: day of month
ODAYe=79      		# end date: ordinal day
DATESTRe=20210320 	# end date: text string for netCDF file name

YEARp=2021    # end date: year 
MONTHp=3      # day after end date: month of year
DAYp=21       # day after end date: day of month

DATESTRc=20210330 # file creation date text string for netCDF file name

COMPILE=FALSE   # TRUE => compile code
DOWNLOAD=TRUE   # download ftp data

DO_STEP0=jALSE   
DO_STEP1=FALSE
DO_STEP2=FALSE
DO_STEP3=FALSE
DO_STEP4=FALSE
DO_STEP5=FALSE
DO_STEP6=FALSE
DO_STEP7=FALSE
DO_STEP8=TRUE
 
