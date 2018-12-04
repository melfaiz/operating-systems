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
###########################
# Premier kill
###########################

kill -10 $(sed -n '1p' < list-PID.txt)
echo " envoi de premier kill d'arbitre $$ au processus $(sed -n '1p' < list-PID.txt)"

###########################
#permier trap SIG1
###########################
trap ' echo "reception de signal de joueur"' 10

while true
 do
   sleep 1
done
