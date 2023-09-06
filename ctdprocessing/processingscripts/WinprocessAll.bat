:: ~CTD Batch Processing in CMD~
:: Michael Cappola (mcappola@udel.edu)
:: Created on: 05/02/2022
:: Last edit: 07/12/2023

:: Winprocessall.bat calls winprocessloop.bat for each .hex file in the raw directory. 
:: Script uses relative pathing. The current directory structure must be preserved.

:: Rawdir must be where the hex and config files are.
:: Processdir and svdir are where the CNV files go. 
:: Scriptsdir are where the .psa files are. If processing modifications are desired, modify these.

:: 07/12/2023 Removed SV calculation path. Not needed.

@echo off

cd..
set "curdir=%cd%"

set "rawdir=%curdir%\raw"
set "processdir=%curdir%\process"
set "scriptdir=%curdir%\processingscripts"

cd processingscripts

setlocal
:PROMPT
SET /P AREYOUSURE=PROCEEDING WILL OVERWRITE %processdir%. PROCEED PROCESSING (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" echo CTD PROCESSING ABORTED & GOTO END 

del /Q %processdir%\*.*

Setlocal EnableDelayedExpansion
for %%F in ("%rawdir%\*.hex") do (
    set file=%%~nF
    call winprocessloop.bat !file!
)

:END

echo EXITED PROGRAM

endlocal