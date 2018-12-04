#!/bin/bash

if [ $# -lt 1 ]
then
    echo "[ERREUR] Passer le nombre de joueurs en argument !"
    exit 1
fi

posList=1
n=$1
joueurs=$1
p="p"
d="d"
###########################
# Premiere fonction
###########################
sig_trap1()
{
    echo "----------"
    echo "reception de joueur $(sed -n $posList$p < list-PID.txt) en sig1"
    posList=$(( 1 + ($posList % $joueurs) ))
    echo "Envoi de kill d'arbitre au processus" $(sed -n $posList$p < list-PID.txt)
    kill -10 $(sed -n $posList$p < list-PID.txt)
    echo "----------"
}
sig_trap2()
{
    echo "----------"
    echo "reception de joueur $(sed -n $posList$p < list-PID.txt) en sig2"
    echo "----------"
}


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
echo "Envoi de premier kill d'arbitre $$ au processus $(sed -n '1p' < list-PID.txt)"

###########################
#permier trap SIG1
###########################
trap 'sig_trap1' 10

###########################
#deuxième trap SIG2
###########################
trap 'sig_trap2' 12


while true
 do
   sleep 1
done
