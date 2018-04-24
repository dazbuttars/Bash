#!/bin/bash
## Read multiple lines from file.dat into array students

(( count = 0 ))
while read class[$count] ; do 
   ((count++))
## Sort the file.dat file alphabetically with the sort command.
done < <(sort file.dat)
## Set up of binary search.
(( f = 0 ))
(( l = $count - 1 ))
## Ask user for name of student.
echo "Please enter the name of the student, followed by [ENTER]:"
read student
## Binary search IF statment.
while [[ $f -le $l ]] ; do
      (( mid = ( $f + $l ) / 2 ))
    ## Cuts Name and Grade apart
      name=$(echo ${class[$mid]} | cut -d: -f1)
      grade=$(echo ${class[$mid]} | cut -d: -f2)
    ## Checks to see if the name and user input is the same.
      if [[ $name == $student ]] ;
      then
        echo " "
        echo  ---------------------------
        echo "       "$name" has a "$grade
        echo  ---------------------------
        echo " "
        exit
      elif [[ $name < $student ]] ; 
      then
        ((f=$mid + 1))
      elif [[ $name > $student ]] ; 
      then
        ((l=$mid - 1))
      fi
done
if [[ $f != $l ]] ;
then
   echo " "
   echo --------------------------------------------
   echo " Student "$student" is not in the Class."
   echo --------------------------------------------
   echo " "
fi
