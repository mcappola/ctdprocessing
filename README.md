# ctdprocessing
Batch scripts to automate and standardize CTD processing with SBE Data Processing software

- Currently working on multple batch files to support different processing routines. Be sure to check if my settings agree with your expectations before use. 
  
- Used McTaggart et al. 2010 (https://www.go-ship.org/Manual/McTaggart_et_al_CTD.pdf) as a guide for PSA settings. 

**TO DO:** 
- Create a set of PSA scripts for troubleshooting the soak, the pump, dual sensors, ect.
- Integrate a logical check to see if the auto advance function on the SBE11 was used. 

### CTD Batch Processing in CMD
Michael Cappola (mcappola@udel.edu)

### SUMMARY
- WinprocessAll will run the entire processing routine, for all files in the raw directory.
- Winprocess will run process one CTD based on user input.
- Both tools now support user batchfiles for other processing schemes.
- Both tools now support argument -nb for skipping bottle processing.

### REQUIREMENTS
- Must use a Windows OS. All testing was done using Windows 10.
- Must have SeatermV2 installed with default options selected. (https://www.seabird.com/software)

### DIRECTIONS FOR INSTALL
- Install required seabird software.
- Clone the "ctdprocessing" directory to where you intend to process files from the deck unit.
- Process the example cast in the raw directory to ensure everything is setup properly.

### DIRECTIONS FOR USE
- Put raw files into the raw directory. These are any files generated from the deck unit.
- Navigate to the processingscripts directory.

**To Process a Single Cast**
- Run winprocess.bat with the batch text filename without extention as the first argument.
-   Example Command: winprocess batch
- To skip the automatic bottlefile processing, "-nb" can be passed as the second argument.
-   Example Command: winprocess batch -nb
- Enter the individual filename when prompted.

**To Process Multiple Casts**
- Run winprocess.bat with the batch text filename without extention as the first argument.
-   Example Command: winprocessall batch
- To skip the automatic bottlefile processing, "-nb" can be passed as the second argument.
-   Example Commnad: winprocessall batch -nb
- This will process every cast in the raw directory.

### This Tool Supports Your PSA Files!
- If you already have batch files and psa files associated with a specific processing routine, you can still use this tool. Simply add your psa files to the processingscripts directory, and then generate a batchfile that calls those specific psa files using the same relative pathing scheme. Recommend using batch.txt as a guide, as this processing scheme is the standard approach. If you generate a processing routine that works with this tool and you want to add it to the repository, feel free to contact me.

### NOTES
Scripts use relative pathing, so this tool can be stored anywhere in your PC, but the directory structure must be preserved. Scripts must be run from the "processingscripts" directory. Directory names must not change.

If this is being used for insitu processing at sea, recommend installing it at the CTD work station. Then you can have the deckunit output the files directly into the raw directory, simplifying the workflow.

