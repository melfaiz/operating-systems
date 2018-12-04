#!/bin/bash

if [ $# -lt 1 ]
then
    echo "[ERREUR] Passer le nombre de joueurs en argument !"
    exit 1
fi
n=$1
while [ $n -gt 0 ]; do
./joueur.sh $$ & 
n=$((n-1))
done

