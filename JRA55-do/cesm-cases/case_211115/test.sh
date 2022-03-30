#!/usr/bin/env sh

DATADIR=/glade/campaign/cesm/development/cross-wg/S2S/JRA55_data # work dir for input, output, intermediate data
HOMEDIR=/glade/u/home/ssfcst/JRA55-do                # root dir for all JRA55-do scripts (repo root dir)
SCRIPTDIR=/glade/u/home/ssfcst/JRA55-do/cesm-scripts # where the CESM wrapper scripts are

# -------------------- user only needs to specify "DATE" -------------------- 
DATE=2021-11-30 		# form: YYYYY-MM-DD

# -------------------- note, start date must always be January 1 -------------------- 
YEARs=$(date +%Y -d "$DATE")	# start date: year 
MONTHs=1			# start date: month 
DAYs=1        			# start date: day of month
ODAYs=1       			# start date: ordinal day (day of year)

YEARe=$(date +%Y -d "$DATE")	# end date: year 
MONTHe=$(date +%m -d "$DATE")	# end date: month
DAYe=$(date +%d -d "$DATE")	# end date: day of month
ODAYe=$(date +%j -d "$DATE") 	# end date: ordinal day (day of year)

YEARp=$(date +%Y -d "$DATE + 1 day")	# day after end date: year 
MONTHp=$(date +%m -d "$DATE + 1 day")	# day after end date: month
DAYp=$(date +%d -d "$DATE + 1 day")	# day after end date: day of month

DATESTRe=$YEARe$MONTHe$DAYe     # end date: text string for netCDF file name
DATESTRc=$YEARe$MONTHe$DAYe	# file creation date text string for netCDF file name

echo DATE = $DATE
echo YEARe = $YEARe
echo MONTHe = $MONTHe
echo DAYe = $DAYe
echo ODAYe = $ODAYe
echo DATESTRe = $DATESTRe
echo DATESTRc = $DATESTRc
echo YEARp = $YEARp
echo MONTHp = $MONTHp
echo DAYp = $DAYp

