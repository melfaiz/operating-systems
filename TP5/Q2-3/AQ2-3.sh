#!/bin/bash

if [ $# -lt 1 ]
then
    echo "[ERREUR] Passer le nombre de joueurs en argument !"
    exit 1
fi

posList=1
n=$1
rm list-PID.txt
echo "6" > revolver.txt

while [ $n -gt 0 ]; do
./joueur.sh $$ & 
n=$((n-1))
echo "$!" >> list-PID.txt
done

