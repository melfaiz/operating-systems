#!/bin/bash

usr2_joueur()
{
	echo "Signal reçu de larbitre"
	nb_balles=$(cat "revolver.txt")
	tir=$(cat "tir.txt")
	echo "Il reste $nb_balles balles."
	if [ $nb_balles -gt 0 ]; then
	./mort.sh
		if [ $tir -eq 1 ];then
			nb_balles=$((nb_balles-1))
			echo "Il reste $nb_balles balles."
			echo "$nb_balles">revolver.txt
			echo "Envoi de SIGUSR2 a l'arbitre"
			kill -SIGUSR2 $PPID
		else
			nb_balles=8
			echo "$nb_balles" > revolver.txt
			echo "$nb_balles balles restante"
			kill -SIGUSR1 $PPID
		fi
	fi
}
trap 'usr2_joueur' SIGUSR2

while true
do
	echo "Joueur $$ : I am stressed et l'arbitre est $1"
	sleep 6
  wait $!
done
