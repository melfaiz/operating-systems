#!/bin/bash

parseRec () {
  cd $1
  liste='ls'
  for file in $liste ; do
    if [ -e $file ] ; then
      echo "--- Fichier  $file" > plante
    elif [ -d $file ]; then
      cd ..
      echo "---- Repertoire $file " > plante
      parseRec $file
    fi
  done
  cd ..
}
parseRec $1
