mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda info --envs
# conda environments:
#
base                     /glade/u/home/ssfcst/anaconda3
mypy38                *  /glade/u/home/ssfcst/anaconda3/envs/mypy38

(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ conda install cmor
Collecting package metadata (current_repodata.json): done
Solving environment: done

# All requested packages already installed.

(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ python runCmorAllWrite-1-5-0-update-atmos.py
Traceback (most recent call last):
  File "runCmorAllWrite-1-5-0-update-atmos.py", line 2, in <module>
    import cmor,json,os
ModuleNotFoundError: No module named 'cmor'

--------------------------
This is because the above was using..

(mypy38) [ssfcst@casper-login2 MRI-JMA-JRA55-do-1-5-0]$ which python
/glade/u/home/ssfcst/anaconda3/bin/python

...which didn't use the python mypy38 environment 
This solved the problem...

/glade/u/home/ssfcst/anaconda3/envs/mypy38/bin/python runCmorAllWrite-1-5-0-update-atmos.py > & runCmorAllWrite-1-5-0-update-atmos.out &
