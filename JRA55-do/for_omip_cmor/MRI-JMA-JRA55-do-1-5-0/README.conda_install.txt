Wed Jan 13 16:18:00 MST 2021 kauff
set up conda environment as per 
https://github.com/HiroyukiTsujino/JRA55-do/wiki/Prepare-python-environment

===========================================================================================
===========================================================================================
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda config --set auto_activate_base false
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda config --append channels conda-forge
Warning: 'conda-forge' already in 'channels' list, moving to the bottom
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda config --get channels
--add channels 'conda-forge'   # lowest priority
--add channels 'defaults'   # highest priority
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda create --name mypy38 python=3.8
WARNING: A conda environment already exists at '/glade/u/home/ssfcst/anaconda3/envs/mypy38'
Remove existing environment (y/[n])? y


Collecting package metadata (current_repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.8.3
  latest version: 4.9.2

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /glade/u/home/ssfcst/anaconda3/envs/mypy38

  added / updated specs:
    - python=3.8


The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  ca-certificates    pkgs/main/linux-64::ca-certificates-2020.12.8-h06a4308_0
  certifi            pkgs/main/linux-64::certifi-2020.12.5-py38h06a4308_0
  ld_impl_linux-64   pkgs/main/linux-64::ld_impl_linux-64-2.33.1-h53a641e_7
  libedit            pkgs/main/linux-64::libedit-3.1.20191231-h14c3975_1
  libffi             pkgs/main/linux-64::libffi-3.3-he6710b0_2
  libgcc-ng          pkgs/main/linux-64::libgcc-ng-9.1.0-hdf63c60_0
  libstdcxx-ng       pkgs/main/linux-64::libstdcxx-ng-9.1.0-hdf63c60_0
  ncurses            pkgs/main/linux-64::ncurses-6.2-he6710b0_1
  openssl            pkgs/main/linux-64::openssl-1.1.1i-h27cfd23_0
  pip                pkgs/main/linux-64::pip-20.3.3-py38h06a4308_0
  python             pkgs/main/linux-64::python-3.8.5-h7579374_1
  readline           pkgs/main/linux-64::readline-8.0-h7b6447c_0
  setuptools         pkgs/main/linux-64::setuptools-51.1.2-py38h06a4308_4
  sqlite             pkgs/main/linux-64::sqlite-3.33.0-h62c20be_0
  tk                 pkgs/main/linux-64::tk-8.6.10-hbc83047_0
  wheel              pkgs/main/noarch::wheel-0.36.2-pyhd3eb1b0_0
  xz                 pkgs/main/linux-64::xz-5.2.5-h7b6447c_0
  zlib               pkgs/main/linux-64::zlib-1.2.11-h7b6447c_3


Proceed ([y]/n)? 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate mypy38
#
# To deactivate an active environment, use
#
#     $ conda deactivate

(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda activate mypy38
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda install cdms2
Collecting package metadata (current_repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.8.3
  latest version: 4.9.2

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /glade/u/home/ssfcst/anaconda3/envs/mypy38

  added / updated specs:
    - cdms2


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    cffi-1.14.4                |   py38ha312104_0         226 KB  conda-forge
    libcf-1.0.3                | py38h2f41aa0_109         273 KB  conda-forge
    libffi-3.2.1               |    hf484d3e_1007          48 KB
    libuuid-2.32.1             |    h14c3975_1000          26 KB  conda-forge
    python-3.8.6               |h852b56e_0_cpython        22.1 MB  conda-forge
    ------------------------------------------------------------
                                           Total:        22.6 MB

The following NEW packages will be INSTALLED:

  attrs              pkgs/main/noarch::attrs-20.3.0-pyhd3eb1b0_0
  blas               pkgs/main/linux-64::blas-1.0-openblas
  brotlipy           pkgs/main/linux-64::brotlipy-0.7.0-py38h27cfd23_1003
  bzip2              pkgs/main/linux-64::bzip2-1.0.8-h7b6447c_0
  cdat_info          conda-forge/noarch::cdat_info-8.2.1-pyh9f0ad1d_1
  cdms2              conda-forge/linux-64::cdms2-3.1.5-py38h11a58eb_3
  cdtime             conda-forge/linux-64::cdtime-3.1.4-py38hac60b08_2
  cffi               conda-forge/linux-64::cffi-1.14.4-py38ha312104_0
  chardet            pkgs/main/linux-64::chardet-4.0.0-py38h06a4308_1003
  cryptography       pkgs/main/linux-64::cryptography-3.3.1-py38h3c74f83_0
  curl               pkgs/main/linux-64::curl-7.71.1-hbc83047_1
  distarray          conda-forge/noarch::distarray-2.12.2-py_1
  esmf               conda-forge/linux-64::esmf-8.0.1-nompi_hcaa3220_2
  esmpy              conda-forge/linux-64::esmpy-8.0.1-nompi_py38h5410a82_2
  future             pkgs/main/linux-64::future-0.18.2-py38_1
  g2clib             conda-forge/linux-64::g2clib-1.6.0-hf3f1b0b_9
  hdf4               pkgs/main/linux-64::hdf4-4.2.13-h3ca952b_2
  hdf5               conda-forge/linux-64::hdf5-1.10.6-nompi_h7c3c948_1111
  idna               pkgs/main/noarch::idna-2.10-py_0
  importlib-metadata pkgs/main/noarch::importlib-metadata-2.0.0-py_1
  importlib_metadata pkgs/main/noarch::importlib_metadata-2.0.0-1
  ipython_genutils   pkgs/main/noarch::ipython_genutils-0.2.0-pyhd3eb1b0_1
  jasper             pkgs/main/linux-64::jasper-1.900.1-hd497a04_4
  jpeg               conda-forge/linux-64::jpeg-9d-h36c2ea0_0
  jsonschema         pkgs/main/noarch::jsonschema-3.2.0-py_2
  jupyter_core       pkgs/main/linux-64::jupyter_core-4.7.0-py38h06a4308_0
  krb5               pkgs/main/linux-64::krb5-1.18.2-h173b8e3_0
  lazy-object-proxy  pkgs/main/linux-64::lazy-object-proxy-1.5.2-py38h27cfd23_0
  libblas            conda-forge/linux-64::libblas-3.8.0-17_openblas
  libcblas           conda-forge/linux-64::libcblas-3.8.0-17_openblas
  libcdms            conda-forge/linux-64::libcdms-3.1.2-h054cd8a_113
  libcf              conda-forge/linux-64::libcf-1.0.3-py38h2f41aa0_109
  libcurl            pkgs/main/linux-64::libcurl-7.71.1-h20c2e04_1
  libdrs             conda-forge/linux-64::libdrs-3.1.2-hc2e2db3_113
  libdrs_f           conda-forge/linux-64::libdrs_f-3.1.2-hae7e664_111
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-7.5.0-hae1eefd_17
  libgfortran4       conda-forge/linux-64::libgfortran4-7.5.0-hae1eefd_17
  libnetcdf          conda-forge/linux-64::libnetcdf-4.7.4-nompi_h56d31a8_107
  libopenblas        pkgs/main/linux-64::libopenblas-0.3.10-h5a2b251_0
  libpng             pkgs/main/linux-64::libpng-1.6.37-hbc83047_0
  libssh2            pkgs/main/linux-64::libssh2-1.9.0-h1ba5d50_1
  libtiff            pkgs/main/linux-64::libtiff-4.1.0-h2733197_1
  libuuid            conda-forge/linux-64::libuuid-2.32.1-h14c3975_1000
  lz4-c              pkgs/main/linux-64::lz4-c-1.9.2-heb0550a_3
  nbformat           pkgs/main/noarch::nbformat-5.0.8-py_0
  netcdf-fortran     conda-forge/linux-64::netcdf-fortran-4.5.3-nompi_hfef6a68_101
  nomkl              pkgs/main/linux-64::nomkl-3.0-0
  numpy              pkgs/main/linux-64::numpy-1.19.2-py38h6163131_0
  numpy-base         pkgs/main/linux-64::numpy-base-1.19.2-py38h75fe3a5_0
  openblas           pkgs/main/linux-64::openblas-0.3.10-0
  openblas-devel     pkgs/main/linux-64::openblas-devel-0.3.10-0
  pycparser          pkgs/main/noarch::pycparser-2.20-py_2
  pyopenssl          pkgs/main/noarch::pyopenssl-20.0.1-pyhd3eb1b0_1
  pyrsistent         pkgs/main/linux-64::pyrsistent-0.17.3-py38h7b6447c_0
  pysocks            pkgs/main/linux-64::pysocks-1.7.1-py38h06a4308_0
  python_abi         conda-forge/linux-64::python_abi-3.8-1_cp38
  requests           pkgs/main/noarch::requests-2.25.1-pyhd3eb1b0_0
  six                pkgs/main/linux-64::six-1.15.0-py38h06a4308_0
  traitlets          pkgs/main/noarch::traitlets-5.0.5-py_0
  urllib3            pkgs/main/noarch::urllib3-1.26.2-pyhd3eb1b0_0
  zipp               pkgs/main/noarch::zipp-3.4.0-pyhd3eb1b0_0
  zstd               pkgs/main/linux-64::zstd-1.4.5-h9ceee32_0

The following packages will be UPDATED:

  ld_impl_linux-64   pkgs/main::ld_impl_linux-64-2.33.1-h5~ --> conda-forge::ld_impl_linux-64-2.35.1-hea4e1c9_1
  python                 pkgs/main::python-3.8.5-h7579374_1 --> conda-forge::python-3.8.6-h852b56e_0_cpython

The following packages will be DOWNGRADED:

  libffi                                     3.3-he6710b0_2 --> 3.2.1-hf484d3e_1007


Proceed ([y]/n)? y                 


Downloading and Extracting Packages
cffi-1.14.4          | 226 KB    | ####################################################################################################################### | 100% 
libcf-1.0.3          | 273 KB    | ####################################################################################################################### | 100% 
python-3.8.6         | 22.1 MB   | ####################################################################################################################### | 100% 
libuuid-2.32.1       | 26 KB     | ####################################################################################################################### | 100% 
libffi-3.2.1         | 48 KB     | ####################################################################################################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda update cdms2
Collecting package metadata (current_repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.8.3
  latest version: 4.9.2

Please update conda by running

    $ conda update -n base -c defaults conda



# All requested packages already installed.

(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda install cmor
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.8.3
  latest version: 4.9.2

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /glade/u/home/ssfcst/anaconda3/envs/mypy38

  added / updated specs:
    - cmor


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    netcdf4-1.5.4              |nompi_py38hec8b9af_103         503 KB  conda-forge
    ------------------------------------------------------------
                                           Total:         503 KB

The following NEW packages will be INSTALLED:

  cftime             pkgs/main/linux-64::cftime-1.3.0-py38h6323ea4_0
  cmor               conda-forge/linux-64::cmor-3.6.0-py38h10f8223_5
  expat              pkgs/main/linux-64::expat-2.2.10-he6710b0_2
  json-c             pkgs/main/linux-64::json-c-0.13.1-h1bed415_0
  netcdf4            conda-forge/linux-64::netcdf4-1.5.4-nompi_py38hec8b9af_103
  udunits2           pkgs/main/linux-64::udunits2-2.2.25-hd30922c_1


Proceed ([y]/n)? y


Downloading and Extracting Packages
netcdf4-1.5.4        | 503 KB    | ####################################################################################################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$
