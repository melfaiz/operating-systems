#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Entrer un seul argument"
    exit 1
fi

trap 'usr2_arbitre' SIGUSR2
trap 'usr1_arbitre' SIGUSR1

nb=$1
p="p"

usr2_arbitre()
{
  echo " "
  posList=$(( 1 + ($posList % $nb) ))
  proc=$(sed -n $posList$p < list-PID.txt)
  echo "Envoi au processus" $(sed -n $posList$p < list-PID.txt)
  kill -SIGUSR2 $proc
  echo " "
}
usr1_arbitre()
{
  echo " "
  echo "UN JOUEUR EST TOUCHE ! : $(sed -n $posList$p < list-PID.txt)"
  echo " "
}
touch tir.txt

echo "8" > revolver.txt

posList=1

rm list-PID.txt

k=$1
while [ $k -gt 0 ]; do
  ./joueur.sh $$ &
  k=$(expr $k - 1 )
  echo "$!" >> list-PID.txt
done

while true
 do
   sleep 1
done
