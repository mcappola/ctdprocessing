CTD Batch Processing in CMD
Michael Cappola (mcappola@udel.edu)

~SUMMARY~
WinprocessAll batch script will run the entire processing routine, for all files in the raw directory.
Winprocess batch script will run process one CTD based on user input.

~REQUIREMENTS~
Must use a Windows OS.
Must have SeatermV2 installed. (https://www.seabird.com/software)

~DIRECTIONS~
To run WinprocessAll, double click the "WinprocessAll.bat", or run from the terminal. A cruise with about 50 casts takes about 30 minutes to process.
To run Winprocess, double click "Winprocess.bat" and input the CTD's filename. 

Scripts must be called from the "processingscripts" directory.

~NOTES~
WinprocessAll uses relative pathing, so this tool can be stored anywhere in your PC, but the directory structure must be preserved. Keep "process", "processingscripts", "raw", and "SV", in the same main directory. WinprocessAll must be run from the "processingscripts" directory. Directory names must not change.

If using this tool to process another cruise, just place the raw files in the raw directory. i.e. ".hex" files, ".bl" files, ".hdr" files, and ".xmlcon" files. This tool is not written to handle other CTD file types, but modifcations to the batchfiles can accommodate this.

If process module settings should be changed, edit the ".psa" files in the "processingscripts" directory using the SBEDataProcessing software that was downloaded within the SeatermV2 package. If processing an entire cruise, recommend running one cast first and checking the header to make sure you agree with the ".psa" inputs. 

All other scripts in the "processingscripts" directory are called by WinprocessAll or Winprocess, and should not be removed.
----------
