:: ~CTD Batch Processing in CMD~
:: Michael Cappola (mcappola@udel.edu)
:: Created on: 11/15/2022
:: Last edit: 07/12/2023

:: Winprocess.bat processes one CTD cast based on user input.

:: 07/12/2023 Removed SV calculation path. Not needed.

@echo off

:: xcopy /Y /Q Y:\raw\*.* C:\Users\cmoffat\work\code\ctdprocessing\raw\

set /P input=ENTER CTD FILENAME (NO EXTENTION) TO PROCESS: 
set station=%input%

cd..
set "curdir=%cd%"

set "rawdir=%curdir%\raw"
set "processdir=%curdir%\process"
set "scriptdir=%curdir%\processingscripts"

cd processingscripts

setlocal

REM *** Always copy the config file.  We need it for processing
copy %rawdir%\%station%.xmlcon %processdir%\%station%.xmlcon > NUL:

REM *** CHECK FOR BOTTLES
set NOBOTTLES="FALSE"
set BATCHFILE=sbebatch.txt
find /c "1," %rawdir%\%station%.bl > NUL:
if errorlevel 1 set NOBOTTLES="TRUE"
if %NOBOTTLES%=="TRUE" set BATCHFILE=sbebatch-nobottles.txt

REM *** CALL THE APPROPRIATE BATCH FILE
Call "C:\Program Files (x86)\Sea-Bird\SBEDataProcessing-Win32\SBEBatch.exe" %BATCHFILE% %station% %rawdir% %processdir% %scriptdir%

:END
echo %station% PROCESSING COMPLETE

endlocal