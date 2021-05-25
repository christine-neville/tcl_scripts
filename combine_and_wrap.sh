cat > wrapper_$1.tcl << EOF
package require pbctools
pbc wrap -all -compound residue -centersel "protein" -center com

set all [atomselect top "all"]
set first_seq [atomselect top "protein"]
set numframes [molinfo top get numframes]
for {set frame 0} {\${frame} < \${numframes}} {incr frame} {
    \${first_seq} frame \${frame}
    \${all} frame \${frame}
    set com [measure center \${first_seq}]
    set move [list [expr [lindex \${com} 0] * -1.0] [expr [lindex \${com} 1] * -1.0] [expr [lindex \${com} 2] * -1.0]]
    \${all} moveby \${move}
}

animate write dcd sims0${1}0-0${1}9/sims0${1}0-0${1}9_centered_wrapped.dcd waitfor all

EOF

vmd step5_charmm2namd.psf sims0${1}0-0${1}9/*.dcd -dispdev text -eofexit < wrapper_$1.tcl > output.log
