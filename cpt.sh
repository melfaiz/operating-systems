#! /bin/bash



# EXERCICE 1 :
# traite le cas dans lequel les arguments du script sont erronés

# if [ $# -ne 1 ]; then
#   echo "Il n’y a pas un et un seul argument";
#   exit 1 ;
# elif [ -d $1 ] ; then
#   echo "l'argument est un chemin vers un répertoire existant ";
#   exit 1 ;
# fi
# read n < $1 ;
# while true ; do
#   n=`expr $n + 1`;
#   echo $n > $1;
#   echo $n;
#   sleep 1;
# done

#EXERCICE 2 :

if [ $# -ne 2 ]; then
  echo "Le nombre d’arguments n’est pas égal à 2";
  exit 1 ;
elif [ ! -e $1 ] ; then
  echo "le premier argument ne correspond pas à un fichier existant";
  exit 1 ;
elif [ -d $1 ] ; then
  echo "le premier argument correspond à un répertoire";
  exit 1 ;
fi

while read line; do
  <$1>
done <$1>.
