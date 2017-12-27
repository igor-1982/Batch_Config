#!/bin/csh
#USAGE :: ./mqdel.csh [Index of Start Job] [Index of End Job]

set start_job = $1
set end_job = $2

while ($start_job <= $end_job)
    qdel $start_job
    @ start_job++
end

