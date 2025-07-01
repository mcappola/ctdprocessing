# ctdprocessing v2.0
Batch scripts to automate and standardize CTD processing with SBE Data Processing software. Simple CTD batch processing with a single click.

 Michael Cappola (mcappola@udel.edu)

 ------

### SUMMARY
This software package is a collection of batch scripts and prebuilt Sea-Bird PSA files to facilitate easy CTD processing, both at sea and in the lab. Batch scripts are written with at-sea technicians in mind and shouldn't require any manipulation from the CTD console. PSA files are programmed to process data in the correct order and use the correct settings for science quality output. Packages supports bulk processing of multiple casts.

### REQUIREMENTS
- Windows OS. All testing was done using Windows 10.
- SeatermV2 installed with default options selected. (https://www.seabird.com/software)

### DIRECTIONS FOR USE
- Put CTD hex files into the "raw" directory. These are any files generated from the deck unit.
- Navigate to the correct processingscripts directory for your CTD and deployment setup.

* *To Process a Single Cast*:
    1. Run Winprocess.bat 
    2. When prompted, type in the file to be processed (no extention)
    3. Click enter
    4. Processed files will appear in the "process" directory

    - To skip automatic bottle file processing, pass -nb as the first arguement from the terminal.
    - To further simplify the processing workflow, a desktop shortcut can be made to the Winprocess.bat file.
    - If at sea, setting up the deckbox to copy the raw files into the "raw" directory will further simplify the workflow.

* *To Process Multiple Casts*
    1. Run Winprocessall.bat
    2. When prompted, accept overwrite warning (if desired).
    3. Click enter
    4. Processed files will appear in the "process" directory
    5. Go get a coffee, this process can take a while. On my computer, 100 casts typically takes about 20 minutes.

    - To skip automatic bottle file processing, pass -nb as the first arguement from the terminal.
    - This script is simply looping through all available hex files, so the "raw" directory should contain only profiles intended to be processed.

### Current Supported Processing Schemes
- SBE9plus Dual Sensor with Oxygen, PAR, Beam Transmission, and Flourensence, in polar water.
- SBE19plus with PAR and Beam Transmission.


### This Tool Can Support Your PSA Files!
- If you already have PSA files associated with a specific processing routine or sensor, you can still use this package. As long as there is a batch.txt and batch_bottle.txt file that correctly references your PSA files, this tool should still handle the automation correctly. If you're interested in working with me on this repo, feel free to reach out or do a pull-request to add your processing routine. I would like to get most common Sea-Bird CTD deployment setups available on here at some point.

### References

https://www.go-ship.org/Manual/McTaggart_et_al_CTD.pdf

https://www.seabird.com/asset-get.download.jsa?id=69833854944

