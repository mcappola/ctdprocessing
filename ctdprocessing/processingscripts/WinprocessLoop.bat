:: ~CTD Batch Processing in CMD~
:: Michael Cappola (mcappola@udel.edu)
:: Created on: 05/02/2022
:: Last edit: 11/05/2022

:: WinprocessLoop.bat is called by winprocessall.bat and requires variables that are set in winprocessall.bat. 
:: For individual cast CTD processing, use winprocess.bat.

@echo off

set station=%1

cls
echo PROCESSING CTD %station%. PLEASE LET THE PROGRAM FINISH.

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

