#!/bin/bash
## read multiple lines from file.dat into an array
(( count = 0 ))
while read students[$count] ; do 
   ((count++))
done < file.dat

## Cut string in half at the dilimiter -d which is the : and gives f1 the first part or the name.
name=$(echo ${students[$mid]} | cut -d: -f1)

## How to know what is the last thing in the array.
last = $count - 1

