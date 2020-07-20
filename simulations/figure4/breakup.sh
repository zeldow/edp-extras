#!/bin/bash

for ((i = 5; i <= 8; i++ ))
do

  oldfile=$(printf "sim%s.r" $i) 
  oldsh=$(printf "sim%s.sh" $i) 

  for ((j = 1; j <= 10; j++ ))
  do

    newfile=$(printf "sim%s_part%s.r" $i $j)
    cp $oldfile $newfile
    
    sed -i "s/.Rdata/.part$j.Rdata/" $newfile
    
    start=$(( $j * 10 - 9 ))
    end=$(( $j * 10 ))
    sed -i "s/for (i in 1:100)/for (i in $start:$end)/" $newfile

    newsh=$(printf "sim%s_part%s.sh" $i $j)
    cp $oldsh $newsh
    sed -i "s/sim$i/sim${i}_part$j/" $newsh

    bsub < $newsh

  done
  
done
