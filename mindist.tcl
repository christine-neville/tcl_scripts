proc mindist {seltext1 seltext2 fout} {

set sel1 [atomselect top "$seltext1"]
set sel2 [atomselect top "$seltext2"]
set nf [molinfo top get numframes]

set outfile [open $fout w]
for {set i 0} {$i < $nf} {incr i} {
    $sel1 frame $i
    $sel2 frame $i
    set mind 100
    foreach a [$sel1 get {x y z}] {
        foreach b [$sel2 get {x y z}] {
            set minab [veclength [vecsub $a $b]]
            if {$minab < $mind} {set mind $minab}
            }
        }
    puts $outfile "$mind"
    }
close $outfile
}
