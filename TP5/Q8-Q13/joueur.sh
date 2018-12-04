#!/bin/bash

sig_player()
{  
   balles=$(cat "revolver.txt")
   res=$(cat "result.txt") 
   if [ $balles -gt 0 ]; then
   ./random.sh
   echo "random= $res"
   if [ $res -eq 0 ];then
      balles=$((balles-1))
      echo "Il reste $balles balle(s)."
      echo "$balles">revolver.txt
      echo "Envoi d'un kill (sig1) de $$ vers l'arbitre $1"
      kill -10 $PPID
   else
      echo "[$$] BANG !"
      balles=6
      echo "$balles" > revolver.txt
      echo "$balles balles restantes"
      echo "Envoi d'un kill (sig2) de $$ vers l'arbitre $1"
      kill -12 $PPID
      exit 0

   fi
   fi
}
trap 'sig_player' 10
while true
do
	echo "$$ Je suis stressé mon père est $1"
	sleep 5
        wait $!
done

