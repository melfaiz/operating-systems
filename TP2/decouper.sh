#! /bin/bash
if [ $# -ne 2 ]; then
  echo "le nombre d’arguments n’est pas égal à 2"
  exit 1 # un code de retour faux
fi
if [ ! -e "$1" ]; then
  echo "$1 ne correspond pas à un fichier existant"
  exit 1
fi
if [ -d $1 ]; then
  echo "$1 ne correspond pas à un fichier existant"
  exit 1
fi


while read line; do
  i=1
  for word in $line
  do
     if [ "$i" -eq "$2" ]; then
      echo $word
     fi
     i=$(expr $i + 1) //incrementer i
  done
done < "$1"



exit 0
