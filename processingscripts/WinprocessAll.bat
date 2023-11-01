:: ~CTD Batch Processing in CMD~
:: Michael Cappola (mcappola@udel.edu)
:: Created on: 05/02/2022
:: Last edit: 11/01/2023

:: Winprocessall.bat calls winprocessloop.bat for each .hex file in the raw directory. 
:: Script uses relative pathing. The current directory structure must be preserved.

:: Rawdir must be where the hex and config files are.
:: Processdir and svdir are where the CNV files go. 
:: Scriptsdir are where the .psa files are. If processing modifications are desired, modify these.

:: 07/12/2023 Removed SV calculation path. Not needed.
:: 11/01/2023 Cleaned up for publishing.
:: 11/01/2023 Updated parameters to winprocessloop. %1 is the batch file (from user input) %2 is the file (from loop)
:: 11/01/2023 Added support for second argument argument -nb, which skips automatic bottle processing.

@echo off

:: Set up directory variables for relative pathing.
cd..
set "curdir=%cd%"
set "rawdir=%curdir%\raw"
set "processdir=%curdir%\process"
set "scriptdir=%curdir%\processingscripts"
cd processingscripts

setlocal

:: Delete all files in the process directory. If processing an entire cruise, we want a clean batch run.
SET /P AREYOUSURE=PROCEEDING WILL OVERWRITE %processdir%. PROCEED PROCESSING (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" echo CTD PROCESSING ABORTED & GOTO END 

del /Q %processdir%\*.*

:: Set batch program from user input.
set BATCHFILE="%1.txt"

:: Apply WinprocessLoop.bat to each hex file in the raw directory.
:: %2 is the optional -nb argument. We pass this to winprocessloop.bat.
Setlocal EnableDelayedExpansion
for %%F in ("%rawdir%\*.hex") do (
    set file=%%~nF
    call winprocessloop.bat %BATCHFILE% !file! %2
)

:END
echo EXITED PROGRAM

endlocal
