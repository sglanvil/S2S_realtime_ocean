#!/usr/bin/env sh
#===============================================================================
# Purpose:
#
# Notes: 
# 
# History:
# o 2021 Jan  B. Kauffman, first version
#===============================================================================

DATADIR=/glade/scratch/ssfcst/JRA55_data
HOMEDIR=~/JRA55-do
LINKDIR=~/JRA55-do/linkdir

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
    
DIR=$DATADIR
if [ ! -d $DIR ]; then mkdir $DIR ; fi

#----- forcing -----------------------------------------------------------------

DIR=$DATADIR/forcing  ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
cd $DIR
DIR=fcst_phy2m    ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=fcst_surf     ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=ice           ; if [ ! -d $DIR ]; then mkdir $DIR ; fi

#----- COBESST -----------------------------------------------------------------

DIR=$DATADIR/COBESST ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
cd $DIR
DIR=daily          ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=daily/grib     ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=daily/grads    ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=daily/netCDF   ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=data           ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=monthly        ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=monthly/grib   ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=monthly/grads  ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=monthly/yymmdd ; if [ ! -d $DIR ]; then mkdir $DIR ; fi

#----- products ----------------------------------------------------------------
DIR=$DATADIR/products  ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
cd $DIR

DIR=products/version_1_5/grads ; if [ ! -d $DIR ]; then mkdir -p $DIR ; fi
DIR=products/version_1_5/netCDF; if [ ! -d $DIR ]; then mkdir -p $DIR ; fi

#----- work --------------------------------------------------------------------
DIR=$DATADIR/work    ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
cd $DIR
DIR=support                             ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=support/netCDF                      ; if [ ! -d $DIR ]; then mkdir $DIR ; fi

DIR=jra55fcst_3hr_TL319r                ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_filt_3hr_TL319            ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
ln -s jra55fcst_filt_3hr_TL319 jra55fcst_3hr_TL319
DIR=jra55fcst_filt_3hr_TL319r           ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_filt_v1_2tq_3hr_TL319     ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_filt_v1_2tq_3hr_TL319r    ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_filt_v1_3_3hr_wind_TL319r ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v0_7_rad_3hr_TL319        ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
ln -s jra55fcst_v0_7_rad_3hr_TL319 jra55fcst_v0_7_rad1_3hr_TL319
DIR=jra55fcst_v0_7_rad_3hr_TL319r       ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_2_3hr_sph2m_TL319r     ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_2_3hr_tmp2m_TL319r     ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_2_prcp_3hr_TL319       ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_2_prcp_3hr_TL319r      ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_3_prcp2_3hr_TL319      ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_3_prod1_3hr_TL319      ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_3_prod1_3hr_TL319r     ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_3_prod2_3hr_TL319      ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_3_prod3_3hr_TL319      ; if [ ! -d $DIR ]; then mkdir $DIR ; fi
DIR=jra55fcst_v1_3_rad2_3hr_TL319       ; if [ ! -d $DIR ]; then mkdir $DIR ; fi


#----- linkdir -----------------------------------------------------------------
cd $LINKDIR
ln -s $DATADIR DATADIR

ln -s $DATADIR/COBESST                    COBESST    
ln -s $DATADIR/JRA55-do-corrfac-v1_3-v1_5 corrfac    
ln -s $DATADIR/JRA55-do-const-data        data       
ln -s $DATADIR/forcing                    forcing    
ln -s $DATADIR/products                   products   
ln -s $DATADIR/table.04                   table.04   
ln -s $DATADIR/work                       work       
ln -s $DATADIR/work/jra55fcst_v0_7_rad1_3hr_TL319 jra55fcst_v0_7_rad1_3hr_TL319    

#----- settings ----------------------------------------------------------------
cd $HOMEDIR/setting
ln -s sample/macros.make.front.cx2550 macros.make
