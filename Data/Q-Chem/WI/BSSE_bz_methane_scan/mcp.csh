#!/usr/bin/env csh

foreach x ($argv)
  set filename = $x:r
  set prefix   = $x:e 
  cp $filename.$prefix ${filename}_a.$prefix
  mv $filename.$prefix ${filename}_b.$prefix
end
    
