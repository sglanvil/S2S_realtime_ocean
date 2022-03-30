#!/usr/bin/env sh
#===============================================================================
# Purpose:
# functions as an input parameter file for other scripts so that other scripts never need to be edited
# 
# History:
# 2020 Oct, B. Kauffman, first version
# 2021 Feb, B. Kauffman, works in full
# 2021 Nov, S. Glanville (sglanvil), edits this file so only "DATE" needs to be edited
#===============================================================================

set -v   # set echo on
#trap '[[ $BASH_COMMAND != echo* ]] && $BASH_COMMAND' DEBUG

# LID=$(date +%y%m%d-%H%M%S)
# LOGFILE=$(pwd)/master.$YEAR.log.$LID
#-------------------------------------------------------------------------------

DATADIR=/glade/campaign/cesm/development/cross-wg/S2S/JRA55_data # work dir for input, output, intermediate data
HOMEDIR=/glade/u/home/ssfcst/JRA55-do                # root dir for all JRA55-do scripts (repo root dir)
SCRIPTDIR=/glade/u/home/ssfcst/JRA55-do/cesm-scripts # where the CESM wrapper scripts are

# -------------------- user only needs to specify "DATE" --------------------
DATE=2021-12-06                 # form: YYYYY-MM-DD

# -------------------- note, start date must always be January 1 --------------------
YEARs=$(date +%Y -d "$DATE")    	# start date: year
MONTHs=1                        	# start date: month
DAYs=1                          	# start date: day of month
ODAYs=1                         	# start date: ordinal day (day of year)
YEARe=$(date +%Y -d "$DATE")    	# end date: year
MONTHe=$(date +%m -d "$DATE")   	# end date: month
DAYe=$(date +%d -d "$DATE")     	# end date: day of month
ODAYe=$(date +%j -d "$DATE")    	# end date: ordinal day (day of year)
YEARp=$(date +%Y -d "$DATE + 1 day")    # day after end date: year
MONTHp=$(date +%m -d "$DATE + 1 day")   # day after end date: month
DAYp=$(date +%d -d "$DATE + 1 day")     # day after end date: day of month
DATESTRe=$YEARe$MONTHe$DAYe     	# end date: text string for netCDF file name
DATESTRc=$YEARe$MONTHe$DAYe     	# file creation date text string for netCDF file name

COMPILE=FALSE   			# TRUE => compile code (usually set to FALSE)
DOWNLOAD=TRUE				# download ftp data (usually set to TRUE)
DO_STEP0=FALSE
DO_STEP1=TRUE
DO_STEP2=TRUE
DO_STEP3=TRUE
DO_STEP4=TRUE
DO_STEP5=TRUE
DO_STEP6=TRUE
DO_STEP7=TRUE
DO_STEP8=TRUE 
