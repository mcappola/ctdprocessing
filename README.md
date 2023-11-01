# ctdprocessing
Batch scripts to automate and standardize CTD processing with SBE Data Processing software

- Current PSA scripts support the SBE911plus with a dual sensor suite, a par sensor, and a transmissometer.
- Current PSA scripts are best for polar water (Long time alignment on the O2 sensor).
  
- Used McTaggart et al. 2010 (https://www.go-ship.org/Manual/McTaggart_et_al_CTD.pdf) as a guide for PSA settings. 

**TO DO:** 
- Create a generic set of PSA scripts that will always work, no matter what the sensor set up is.
- Create a set of PSA scripts for troubleshooting the soak, the pump, dual sensors, ect.
- Create multiple batchfiles to support different processing schemes.

### CTD Batch Processing in CMD
Michael Cappola (mcappola@udel.edu)

### SUMMARY
- WinprocessAll batch script will run the entire processing routine, for all files in the raw directory.
- Winprocess batch script will run process one CTD based on user input.
- Both tools now support user batchfiles to support other processing schemes.

### REQUIREMENTS
- Must use a Windows OS.
- Must have SeatermV2 installed. (https://www.seabird.com/software)

### DIRECTIONS FOR INSTALL
- Install required seabird software.
- Clone the "ctdprocessing" directory to where you intend to process files from the deck unit.

### DIRECTIONS FOR USE
- Put raw files into the raw directory. These are any files generated from the deck unit.

**To Process a Single Cast**
- Run "Winprocess BatchTextFileName_NoExtension, and enter the individual filename when prompted.
- To skip the automatic bottlefile processing, Run "Winprocess BatchTextFileName_NoExtension -nb", and enter the individual filename when prompted.

**To Process Multiple Casts**
- Run "WinprocessAll BatchTextFileName_NoExtension". This will process every cast in the raw directory.
- To skip the automatic bottlefile processing, Run "WinprocessAll BatchTextFileName_NoExtension -nb", and enter the individual filename when prompted.

### This Tool Supports Your Batch Files!
- If you already have batch files and psa files associated with a specific processing routine, you can still use this tool. Simply add your psa files to the processingscripts directory, and then generate a batchfile that calls those specific psa files using the same relative pathing scheme. Recommend using batch.txt as a guide, as this processing scheme is the standard approach. If you generate a processing routine that works with this tool and you want to add it to the repository, feel free to contact me.

### NOTES
Scripts use relative pathing, so this tool can be stored anywhere in your PC, but the directory structure must be preserved. Scripts must be run from the "processingscripts" directory. Directory names must not change.

If this is being used for insitu processing at sea, recommend installing it at the CTD work station. Then you can have the deckunit output the files directly into the raw directory, simplifying the workflow.

