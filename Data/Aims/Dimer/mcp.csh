#!/bin/csh -xvf

foreach x ($argv)
    cp $x/elec_state ../Atoms_CP/$x/
end
