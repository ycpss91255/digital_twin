#!/bin/bash
GetGraphCard(){
  GraphicsCard=$(lspci | grep VGA)
  if $1 ; then
    echo $GraphicsCard
  fi
  GraphicsCard=${GraphicsCard##*:}
  GraphicsCard=${GraphicsCard#* }
  GraphicsCard=${GraphicsCard%% *}
  GraphicsCard=$(echo $GraphicsCard | tr [a-z] [A-Z])
}
