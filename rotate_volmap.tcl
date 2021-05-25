set chainA [atomselect 0 "protein and chain A"]
set chainB [atomselect 0 "protein and chain B"]
set chainC [atomselect 0 "protein and chain C"]
set chainD [atomselect 0 "protein and chain D"]

set tmatAB [measure fit $chainA $chainB]
set tmatBC [measure fit $chainB $chainC]
set tmatCD [measure fit $chainC $chainD]

set lig [atomselect 1 "all"]

set fname [molinfo 1 get filename]
set molname [string range $fname 0 end-4]

volmap density [atomselect 1 "all"] -res 0.5 -weight mass -minmax {{195 195 182} {205 205 190}} -o ${molname}_0.dx
 
foreach t [list $tmatAB $tmatBC $tmatCD] i [list 1 2 3] {
	$lig move $t
	volmap density [atomselect 1 "all"] -res 0.5 -weight mass -minmax {{195 195 182} {205 205 190}} -o ${molname}_${i}.dx
	$lig writepdb ${molname}_${i}.pdb
}

