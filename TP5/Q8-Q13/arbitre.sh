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
# Première fonction
###########################
sig_trap1()
{
    echo "----------"
    echo "le joueur $(sed -n $posList$p < list-PID.txt) a envoyé un signal"
    posList=$(( 1 + ($posList % $joueurs) ))
    echo "l'arbitre envoi un signal au processus" $(sed -n $posList$p < list-PID.txt)
    kill -10 $(sed -n $posList$p < list-PID.txt)
    echo "----------"
}
###########################
# Deuxième fonction
###########################
sig_trap2()
{
    echo "----------"
    echo "le joueur $(sed -n $posList$p < list-PID.txt) est touché"
    joueurs=$(( $joueurs - 1 ))
    if [ "$joueurs" -eq "0" ]; then
        echo "----------"
        echo "[Arbitre] Tout le monde est mort !"
        echo "----------"
        exit 0
    fi
    pids=$(sed $posList$d list-PID.txt)
    echo "$pids" > list-PID.txt
    if [ "$joueurs" -eq "1" ]; then
        echo "[Arbitre] $(cat list-PID.txt) est le dernier survivant..."
    fi
    posList=$(( 1 + ($posList % $joueurs) ))
    echo " envoi de kill(sig1) d'arbitre au processus" $(sed -n $posList$p < list-PID.txt)
    kill -10 $(sed -n $posList$p < list-PID.txt)
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
echo "Envoi du premier kill d'arbitre $$ au processus $(sed -n '1p' < list-PID.txt)"

###########################
#permier trap 
###########################
trap 'sig_trap1' 10

###########################
#second trap 
###########################
trap 'sig_trap2' 12


while true
 do
   sleep 1
done
