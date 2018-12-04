#!/bin/bash

boucleRec () {

  if [ $1 -ne 0 ]; then
    i=$1
    echo $i
    i=$(expr $i - 1)
    boucleRec $i
  else
    echo "X n'est plus"
  fi
}
boucleRec $1
