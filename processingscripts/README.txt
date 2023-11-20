CTD Batch Processing in CMD
Michael Cappola (mcappola@udel.edu)

Currently working on how different batchfiles are used; be sure to check if my current settings match your expectations before use. 

batch.txt - Complete processing routine for polar water on a SBE911 plus, dual sensor suite, transmissometer, and PAR. 
batch_bottle.txt - Matched with to batch.txt, but for bottle files. 
batch_db.txt - Dual Basic. Processes temperature, conductivity. Calculates salinity and denisity. Should theoretically work on any SBE911 setup.
batch_do.txt - Dual Oxygen. Processes temperature, conductivity, and oxygen. Calculates salinity and denisity. Should theoretically work on any SBE911 setup with oxygen sensors. Assumes non-polar water.

batch_datcnv.txt - Only calls datcnv. Use for troubleshooting.
