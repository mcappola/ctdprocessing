# ctdprocessing
Batch scripts to automate CTD processing with SBE Data Processing software

- Current PSA scripts support the SBE911plus with a dual sensor suite, a par sensor, and a transmissometer.
- Current PSA scripts are best for polar water (Long time alignment on the O2 sensor).
  
- Used McTaggart et al. 2010 (https://www.go-ship.org/Manual/McTaggart_et_al_CTD.pdf) as a guide for PSA settings. 

**TO DO:** 
- Create a generic set of PSA scripts that will always work, no matter what the sensor set up is.
- Create a set of PSA scripts for troubleshooting the soak, the pump, dual sensors, ect.
- Make all of the PSA file names the generic names from SBE so users can easily use their own.

### CTD Batch Processing in CMD
Michael Cappola (mcappola@udel.edu)

### SUMMARY
- WinprocessAll batch script will run the entire processing routine, for all files in the raw directory.
- Winprocess batch script will run process one CTD based on user input.

### REQUIREMENTS
- Must use a Windows OS.
- Must have SeatermV2 installed. (https://www.seabird.com/software)

### DIRECTIONS FOR INSTALL
- Install required seabird software.
- Download the "ctdprocessing" directory. Current version requires that the directory structure is preserved.

### DIRECTIONS FOR USE
- Put raw files into the raw directory. This is any files generated from the deck unit.
- To process a single cast, double click "Winprocess.bat" and input the cast's filename. This can be done from the terminal.
- To process multiple casts, double click the "WinprocessAll.bat", or run from the terminal. A cruise with about 50 casts can take upto 30 minutes to process if the casts were deep (>1000m).

### NOTES
Scripts use relative pathing, so this tool can be stored anywhere in your PC, but the directory structure must be preserved. Keep "process", "processingscripts", and "raw", in the same main directory. WinprocessAll must be run from the "processingscripts" directory. Directory names must not change.

If process module settings should be changed, edit the ".psa" files in the "processingscripts" directory using the SBEDataProcessing software that was downloaded within the SeatermV2 package. If processing an entire cruise, recommend running one cast first and checking the header to make sure you agree with the ".psa" inputs. 

All other scripts in the "processingscripts" directory are called by WinprocessAll or Winprocess, and should not be removed.

If this is being used for insitu processing at sea, recommend installing it at the CTD work station. Then you can have the deckunit output the files directly into the raw directory. 

