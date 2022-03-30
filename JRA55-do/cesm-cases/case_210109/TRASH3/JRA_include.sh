#!/usr/bin/env sh
#===============================================================================
# Purpose:
#  
# Notes: 
# 
# History:
# o 2020 Oct, B. Kauffman, first version
#===============================================================================

 set -v   # set echo on
#trap '[[ $BASH_COMMAND != echo* ]] && $BASH_COMMAND' DEBUG
#-------------------------------------------------------------------------------
# LID=$(date +%y%m%d-%H%M%S)
# LOGFILE=$(pwd)/master.$YEAR.log.$LID

alias wgrib=/glade/u/home/ssfcst/local/bin/wgrib

DATADIR=/glade/campaign/cesm/development/cross-wg/S2S/JRA55_data # where input, output, intermediate data is
HOMEDIR=/glade/u/home/ssfcst//JRA55-do               # where the standard JRA55-do scripts are
SCRIPTDIR=/glade/u/home/ssfcst/JRA55-do/cesm-scripts # where the CESM wrapper scripts are

YEARs=2021    # start date: year 
MONTHs=1      # start date: month 
DAYs=1        # start date: day in month
ODAYs=1       # start date: ordinal day (day in year)

YEARe=2021    # end date: year -- ?  assume YEARs = YEARe
MONTHe=1      # end date: month 
DAYe=9        # end date: day in month
ODAYe=9       # end date: ordinal day
DATESTRe=2021-01-09 # end date: text string for netCDF file name

DATESTRc=20210211 # end date: text string for netCDF file name

YEARp=2021    # end date: year -- ?  assume YEARs = YEARp
MONTHp=1      # day after end date: month
DAYp=10       # day after end date: day
ODAYp=10      # day after end date: ordinal day

COMPILE=FALSE   # TRUE => compile code
DOWNLOAD=TRUE   # download ftp data

DO_STEP0=FALSE
DO_STEP1=TRUE
DO_STEP2=TRUE
DO_STEP3=TRUE
DO_STEP4=TRUE
DO_STEP5=TRUE
DO_STEP6=TRUE
DO_STEP7=TRUE
DO_STEP8=TRUE 
