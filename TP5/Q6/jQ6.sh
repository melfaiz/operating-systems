#!/bin/bash

sig_player()
{  
   balles=$(cat "revolver.txt")
   echo $balles
   if [ $balles -gt 0 ]; then
   balles=$((balles-1))
   echo "Il reste $balles balle(s)."
   echo "$balles">revolver.txt
   echo "Envoir de kill (sig1) de joueur $$ vers $PPID"
   kill -10 $PPID
   fi
}
trap 'sig_player' 10
while true
do
	echo "$$ Je suis stressé mon père est $1"
	sleep 5
        wait $!
done

