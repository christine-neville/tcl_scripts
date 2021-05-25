proc pdbprint {numprints, fout} {
    set numprints [lindex $argv 0]
    set fout [lindex $argv 1]
    set numframes [molinfo top get numframes]
    set step [expr int($numframes/$numprints)]
    set all [atomselect top "all"]
    for {set i 0} {$i < $numframes} {incr i $step} {
        ${all} frame ${i}
        ${all} writepdb ${fout}_frame_${i}.pdb
    }
}
