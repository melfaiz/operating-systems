#!/bin/bash

sig_player()
{  
   echo "Envoir de kill (sig1) de joueur $$ vers $PPID"
   kill -10 $1
}
trap 'sig_player' 10
while true
do
	echo "$$ Je suis stressé mon père est $1"
	sleep 5
        wait $!
done

