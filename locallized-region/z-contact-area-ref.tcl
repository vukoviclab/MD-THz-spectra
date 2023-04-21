menu main on
mol load psf z-tot.psf dcd z-tot.dcd

set outfile [open z-contact-dop-wD10.csv w]

set nf [molinfo top get numframes]
set p [atomselect top "water and (y^2 + z^2) > 4"]
set n [atomselect top "index "]
set np [atomselect top "(water and (y^2 + z^2) > 4) or (index )"]

for {set i 0} {$i < $nf} {incr i 100} {
      $p frame $i
      $n frame $i
      $np frame $i

      $p update 
      $n update 
      $np update 




   set sasap [measure sasa 1.4 $p -restrict $p]
   set sasan [measure sasa 1.4 $n -restrict $n]
   set sasanp [measure sasa 1.4 $np -restrict $np]
   puts "frame $i"
   set tot [expr {0.5*($sasap+$sasan-$sasanp)}]
   set tim [expr {0.1*($i)}]
   puts $outfile "$i,$tot"
 }

exit

