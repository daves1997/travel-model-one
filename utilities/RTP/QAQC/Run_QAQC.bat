:: ---------------------------------
::
:: This batch script helps QAQC of
:: - AV share
:: - Bike mode share (for the Complete Street strategy)
:: - Max congested speed (for the Vision Zero strategy)
::
:: ---------------------------------

:: this script assumes that M_DIR is already been set in setupmodel.bat
mkdir "%M_DIR%/OUTPUT/QAQC"

:: ---------------------------------
:: check household-owned AV share
:: ---------------------------------

set GITHUB_MASTER=\\mainmodel\MainModelShare\travel-model-one-master

:: assume this script is being run from the directory with the full model run
mkdir QAQC
copy /y "%GITHUB_MASTER%\utilities\RTP\QAQC\Car_ownership_AVHV.r"             QAQC\Car_ownership_AVHV.r

cd main
call "%R_HOME%\bin\x64\Rscript.exe" ..\QAQC\Car_ownership_AVHV.R
cd ..

copy /y "%GITHUB_MASTER%\utilities\RTP\QAQC\Car_ownership_summary_2035.xlsx"       "%M_DIR%\OUTPUT\QAQC\Car_ownership_summary_2035.xlsx"
copy /y "%GITHUB_MASTER%\utilities\RTP\QAQC\Car_ownership_summary_2050.xlsx"       "%M_DIR%\OUTPUT\QAQC\Car_ownership_summary_2050.xlsx"

cd QAQC
copy /y "PBA50_QAQC.csv"                                                "%M_DIR%\OUTPUT\QAQC\PBA50_QAQC.csv"
cd ..

:: ---------------------------------
:: check bike mode share
:: --------------------------------- 
copy /y "%GITHUB_MASTER%\utilities\RTP\QAQC\Mode_share.twb"             "%M_DIR%\OUTPUT\QAQC\Mode_share.twb"