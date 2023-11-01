:: ~CTD Batch Processing in CMD~
:: Michael Cappola (mcappola@udel.edu)
:: Created on: 11/15/2022
:: Last edit: 11/01/2023

:: Winprocess.bat processes one CTD cast based on user input.

:: 07/12/2023 Removed SV calculation path. Not needed.
:: 10/31/2023 Made the batch file (no ext) the first argument. Now the code supports running other batch files. 
:: 11/01/2023 Added optional argument -nb to not process bottles, even if bottles were fired.

@echo off

:: File input.
set /P input=ENTER CTD FILENAME (NO EXTENTION) TO PROCESS: 
set station=%input%

:: Set up directory variables for relative pathing.
cd..
set "curdir=%cd%"
set "rawdir=%curdir%\raw"
set "processdir=%curdir%\process"
set "scriptdir=%curdir%\processingscripts"
cd processingscripts
setlocal

:: Copy the config file.  We need it for processing and archival.
copy %rawdir%\%station%.xmlcon %processdir%\%station%.xmlcon > NUL:

:: Set batch program from user input.
set BATCHFILE="%1.txt"

:: Process cast.
Call "C:\Program Files (x86)\Sea-Bird\SBEDataProcessing-Win32\SBEBatch.exe" %BATCHFILE% %station% %rawdir% %processdir% %scriptdir%

:: Check if bottle file exists. Set BOTTLE variable to FALSE if it does not.
set BOTTLES="TRUE"
find /c "1," %rawdir%\%station%.bl > NUL:
if errorlevel 1 set BOTTLES="FALSE"

:: Optional user input to not process the bottle file.
if "%2"=="-nb" set BOTTLES="FALSE"

:: Process bottle file if BOTTLE variable is true. 
:: Bottle processing method does not change from region to , so this can remain a fixed input.
if %BOTTLES%=="TRUE" Call "C:\Program Files (x86)\Sea-Bird\SBEDataProcessing-Win32\SBEBatch.exe" batch_bottle.txt %station% %rawdir% %processdir% %scriptdir%

:END
echo %station% PROCESSING COMPLETE

endlocal