#!/bin/bash

for i in {1..10}
	do
	sed -i "s/set outfile.*/set outfile [open z-index-dop-wD$i.csv w]/g" z-contact-index-dop-ref.tcl
	sed -i "s/set p.*/set p \[atomselect top \"resname CNT and (same residue as resname CNT and within 8 of segname D$i)\"]/g" z-contact-index-dop-ref.tcl
	vmd -dispdev text -e z-contact-index-dop-ref.tcl
	
	indexes=`python cindex.py z-index-dop-wD$i.csv 4000`


	sed -i "s/set outfile.*/set outfile [open z-contact-dop-wD$i.csv w]/g" z-contact-area-ref.tcl
	sed -i "s/set n .*/set n \[atomselect top \"index $indexes\"\]/" z-contact-area-ref.tcl
	sed -i "s/set np .*/set np \[atomselect top \"(water and (y^2 + z^2) > 4) or (index $indexes)\"\]/" z-contact-area-ref.tcl
        
	vmd -dispdev text -e z-contact-area-ref.tcl

	done
