# MD-THz-spectra: Localized Contact Water Area Calculation

This repository contains all the necessary scripts to calculate the localized contact water area in molecular dynamics simulations.

## Instructions

1. Ensure that the following files are located in the same directory:
   - `z-contact-index-dop-ref.tcl`
   - `z-contact-area-ref.tcl`

2. Name your DCD and PSF files with the `z-tot` prefix, for example:
   - `z-tot.dcd`
   - `z-tot.psf`

3. Install the required Python packages, `pandas` and `numpy`, by running the following command:

4. To find the gray region, simply execute the `z-contact-area-dop-index.sh` script:

`./z-contact-area-dop-index.sh`

This will calculate the localized contact water area based on the provided DCD and PSF files. Make sure all the required files are in the same directory before running the script.




