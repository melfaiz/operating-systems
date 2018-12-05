#! /bin/bash

nb_balle=$(cat "revolver.txt")
x=$(($RANDOM % $nb_balle))
if [ "$x" -eq "1" ]; then
echo "0">tir.txt
else
echo "1">tir.txt
fi
