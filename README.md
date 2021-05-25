# Tcl Scripts

Basic tcl scripts for use with VMD

**mindist:**
Calculates the minimum distance between two selections in each frame of a trajectory and prints data to an output file.
Usage: mindist sel1 sel2 outfilename

**pdbprint:**
Prints pdb files at regular intervals from a trajectory.
Usage: pdbprint n fout
  * where n is the total number of prints you want from the trajectory, and
  * fout is the name you want prepended to each output pdb file
  
**combine_and_wrap.sh:**
Combines, wraps, and centers a set of .dcd files.
Takes as input an integer corresponding to a directory name. For example, if the argument '4' is given, the script looks for a directory called "sims\_040-049" and loads all .dcd files from this directory. It wraps and centers them based on the center of mass of the protein, then writes the data to a new .dcd file within that directory called "sims040-049\_centered_wrapped.dcd". Must be used on unwrapped trajectory.
