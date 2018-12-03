#! /bin/bash

if [ $# -ne 1 ]; then
  echo "Provide one argument only"
  exit 1
fi

if [ $1 -gt 1 ]; then
  k=$(expr $1 - 1)
  echo " Il reste $k gladiateurs a créer"
  ./gladiateur.sh $k &
fi

export pidInitial=$$

trap 'echo $$ : Morituri Te Salutant ; exit 0' USR1

while true ; do
    sleep 2 &
    wait $!
    echo $$ : AVE CEASAR
done

exit 0
