:: ~CTD Batch Processing in CMD~
:: Michael Cappola (mcappola@udel.edu)
:: Created on: 05/02/2022
:: Last edit: 11/05/2022

:: WinprocessLoop.bat is called by winprocessall.bat and requires variables that are set in winprocessall.bat. 
:: For individual cast CTD processing, use winprocess.bat.

@echo off

:: Store arguments into variables.
set BATCHFILE=%1
set station=%2

cls
echo PROCESSING CTD %station%. PLEASE LET THE PROGRAM FINISH.

:: Copy the config file.  We need it for processing and archival.
copy %rawdir%\%station%.xmlcon %processdir%\%station%.xmlcon > NUL:

:: Process cast.
Call "C:\Program Files (x86)\Sea-Bird\SBEDataProcessing-Win32\SBEBatch.exe" %BATCHFILE% %station% %rawdir% %processdir% %scriptdir%

:: Check if bottle file exists. Set BOTTLE variable to FALSE if it does not.
set BOTTLES="TRUE"
find /c "1," %rawdir%\%station%.bl > NUL:
if errorlevel 1 set BOTTLES="FALSE"

:: Optional user input to not process the bottle file.
if "%3"=="-nb" set BOTTLES="FALSE"

:: Process bottle file if BOTTLE variable is true. 
:: Bottle processing method does not change, so this can remain a fixed input.
if %BOTTLES%=="TRUE" Call "C:\Program Files (x86)\Sea-Bird\SBEDataProcessing-Win32\SBEBatch.exe" batch_bottle.txt %station% %rawdir% %processdir% %scriptdir%

