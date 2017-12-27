#!/bin/tcsh                                                                                                                                                                                                                            

set j=$1
while ( $j < $2 )
    scancel $j
    @ j++
end

