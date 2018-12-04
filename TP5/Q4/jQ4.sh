#!/bin/bash

sig_player()
{
   echo " père $PPID,  père $1"
   kill -10 $PPID
}
trap 'sig_player' 10
while true
do
	echo "$$ Je suis stressé mon père est $1"
	sleep 5
        wait $!
done

