! -*-F90-*-
program make_annual_mean_climatology

  implicit none

  integer(4) :: imut, jmut
  integer(4),allocatable :: num_xgrid(:)
  character(256) :: grid_name
  integer(4) :: total_grid_1d

  integer(4) :: ibgn, iend, i0

  real(4),allocatable :: work4(:)

  real(8),allocatable :: data_in(:)
  real(8),allocatable :: data_cl(:)
  real(8),allocatable :: data_mask(:)

  real(8),allocatable :: data_cl_latlon(:,:)

  real(8),allocatable :: data_org(:), data_new(:)
  real(8),allocatable :: mask_org(:)
  real(8),allocatable :: lon_org(:), lon_new(:)
  real(8) :: dlon, dlon_rg
  real(8),allocatable :: lat_org(:)
  integer(4),allocatable :: nvalid(:)

  character(256) :: file_monthly, file_monthly_base
  character(256) :: file_mask

  character(256) :: file_clim_org
  character(256) :: file_clim_latlon

  integer(4),parameter :: lun=10

  integer(4) :: i, j, ii, jj, n
  real(8) :: weight

  integer(4) :: iii, m, m_left, m_right, i_left, i_right

  integer(4) :: nbyr, nbmn, neyr, nemn, month, nyear
  integer(4) :: ibmn, iemn, mday
       
  integer(4) :: ndmon(12) = (/ 31,28,31,30,31,30,31,31,30,31,30,31 /)

  logical :: l_leap
  logical :: l_leap_valid

  real(4) :: undef4_in, undef4_out
  real(8) :: undef8_in, undef8_out

  !---------------------------------------------

  namelist /nml_make_annclim/ &
       & file_mask,           &
       & file_monthly_base,   &
       & undef4_in,           &
       & l_leap_valid,   &
       & file_clim_org,  &
       & file_clim_latlon, &
       & undef4_out,            &
       & imut, jmut, dlon, grid_name, &
       & nbyr, nbmn, neyr, nemn

  !---------------------------------------------

  nbmn=1
  nemn=12
  open(lun,file='namelist.make_annclim')
  read(lun,nml=nml_make_annclim)
  close(lun)

  undef8_in  = real(undef4_in,8)
  undef8_out = real(undef4_out,8)

  !---------------------------------------------

  allocate(num_xgrid(1:jmut))
  allocate(data_cl_latlon(1:imut,1:jmut))
  allocate(data_new(1:imut))
  allocate(lon_new(1:imut))

  do i = 1, imut
    lon_new(i) = dlon * real(i-1,8)
  end do

  call set_reduced_grid(grid_name,num_xgrid,jmut,total_grid_1d)

  allocate(work4(1:total_grid_1d))

  allocate(data_in  (1:total_grid_1d))
  allocate(data_cl  (1:total_grid_1d))
  allocate(data_mask(1:total_grid_1d))
  allocate(nvalid   (1:total_grid_1d))

  !----------------------------------------------

  open(lun,file=file_mask,form='unformatted',access='direct', &
       & convert='little_endian',recl=4*total_grid_1d)
  read(lun,rec=1) work4
  data_mask(1:total_grid_1d) = real(work4(1:total_grid_1d),8)
  close(lun)
  do n = 1, total_grid_1d
    data_mask(n) = 1.0d0 - data_mask(n) ! 0 for land, 1 for water
  end do

  !----------------------------------------------

  data_cl(:) = 0.0d0
  nvalid(:) = 0

  do nyear = nbyr, neyr

    l_leap = .false.

    if (l_leap_valid) then
      if (mod(nyear,4)   == 0) l_leap = .true.
      if (mod(nyear,100) == 0) l_leap = .false.
      if (mod(nyear,400) == 0) l_leap = .true.
    end if

    ibmn = 1
    iemn = 12

    if (nyear == nbyr) ibmn = nbmn
    if (nyear == neyr) iemn = nemn
    
    do month = ibmn, iemn

      write(6,*) 'Year = ', nyear, ' Month = ', month

      if (month /= 2) then
        mday = ndmon(month)
      else
        if (l_leap) then
          mday = ndmon(month) + 1
        else
          mday = ndmon(month)
        end if
      end if

      write(file_monthly,'(1a,i4.4,i2.2)') trim(file_monthly_base),nyear,month
      open(lun,file=file_monthly,form='unformatted',access='direct', &
           & convert='little_endian',recl=4*total_grid_1d)
      write(6,*) trim(file_monthly)
      read(lun,rec=1) work4
      close(lun)

      do n = 1, total_grid_1d
        if ((work4(n) /= undef4_in) .and. (abs(work4(n)) < 1.0e10)) then
          data_cl(n) = data_cl(n) + real(work4(n),8) * real(mday,8)
          nvalid(n) = nvalid(n) + mday
        end if
      end do

    end do

  end do

  do n = 1, total_grid_1d
    if (nvalid(n) > 0) then
      data_cl(n) = data_cl(n) / real(nvalid(n),8)
    else
      data_cl(n) = undef8_out
    end if
  end do
  
  do n = 1, total_grid_1d
    if (nvalid(n) > 0) then
      write(6,*) ' Number of days = ', nvalid(n), nvalid(n)/365.25, ' years '
      exit
    end if
  end do
  
  ! reduced grid to lat-lon grid for check

  i0 = 0

  do j = 1, jmut

    ibgn = i0 + 1
    iend = i0 + num_xgrid(j)

    if (num_xgrid(j) == imut) then

      data_cl_latlon(1:imut,jmut-j+1) = data_cl(ibgn:iend)

    else

      allocate(data_org(1:num_xgrid(j)+1))
      allocate(lon_org (1:num_xgrid(j)+1))

      data_org(1:num_xgrid(j)) = data_cl(ibgn:iend)
      data_org(num_xgrid(j)+1) = data_cl(ibgn)

      dlon_rg = 360.0 / real(num_xgrid(j),8)

      do ii = 1, num_xgrid(j) + 1
        lon_org(ii) = dlon_rg * real(ii-1,8)
      end do

      do i = 1, imut
        do ii = 1, num_xgrid(j)
          if (abs(lon_org(ii) - lon_new(i)) < 1.0d-4) then
            data_new(i) = data_org(ii)
            exit
          else if ( (lon_org(ii) < lon_new(i)) .and. (lon_new(i) <= lon_org(ii+1)) ) then
            weight = (lon_new(i) - lon_org(ii)) / (lon_org(ii+1) - lon_org(ii))
            data_new(i) = (1.0d0 - weight) * data_org(ii) + weight * data_org(ii+1)
            exit
          end if
        end do
      end do
      data_cl_latlon(1:imut,jmut-j+1) = data_new(1:imut)
      deallocate(data_org)
      deallocate(lon_org)
    end if
    i0 = iend
  end do

  write(6,*) ' outfile = ',trim(file_clim_org)
  open (lun,file=file_clim_org,form='unformatted',access='direct', &
       & convert='little_endian',recl=4*total_grid_1d)
  write(lun,rec=1) real(data_cl,4)
  close(lun)
  
  write(6,*) ' outfile = ',trim(file_clim_latlon)
  open (lun,file=file_clim_latlon,form='unformatted',access='direct', &
       & recl=4*imut*jmut)
  write(lun,rec=1) real(data_cl_latlon,4)
  close(lun)
  
  !---------------------------------------------

end program make_annual_mean_climatology
