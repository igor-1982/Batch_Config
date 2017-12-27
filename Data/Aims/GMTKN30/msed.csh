#!/bin/csh

foreach x ($argv)
    sed s/'   QChem'/'    Aims'/g $x > test.tt
    mv test.tt $x
end
