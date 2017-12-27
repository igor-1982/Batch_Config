#!/bin/csh -xf

set subset = W42
#foreach x (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29)
foreach x (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19)
#foreach x (01 02)
  cp Example.com $subset-$x.com
  sed s/Example/$subset-$x/g $subset-$x.com > test.com
  mv test.com $subset-$x.com
end

