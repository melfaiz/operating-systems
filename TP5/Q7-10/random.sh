#! /bin/bash

balle=$(cat "revolver.txt")
x=$(($RANDOM % $balle))
if [ "$x" -eq "1" ]; then
echo "1"> result.txt
else
echo "0"> result.txt
fi
