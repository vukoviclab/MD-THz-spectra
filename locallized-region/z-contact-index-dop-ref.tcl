menu main on
mol load psf z-tot.psf dcd z-tot.dcd

set outfile [open z-index-dop-wD10.csv w]
set nf [molinfo top get numframes]
set p [atomselect top "resname CNT and (same residue as resname CNT and within 8 of segname D10)"]
#set p [atomselect top "resname CNT and (same residue as resname CNT and within 8 of segname D10)"]

puts $outfile "frame,index"

for {set i 0} {$i < $nf} {incr i 1} {

$p frame $i
$p update

set cindex [$p get index]

puts $outfile "$i,$cindex"

}
exit

