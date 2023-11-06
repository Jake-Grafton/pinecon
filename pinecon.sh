#!/bin/bash

# Permission check
if [ "$EUID" -ne 0 ]
  then echo "pinecon.sh needs root permissions!"
  exit
fi

# Menu
menu(){
  echo -e "[1] Set interface to 172.16.42.*\n[2] Connect via SSH\n[3] Exit"
  read -p ">> " menuin
  if [ "$menuin" == "1" ]
    then setint
  elif [ "$menuin" == "2" ]
    then connect
  elif [ "$menuin" == "3" ]
    then exit
  else menu
  fi
}

# Set interface
setint(){
  read -p "Enter a number (10-100): " lastoct
  sudo ifconfig enx001337a7834f 172.16.42.$lastoct # enx* COULD CHANGE!
  menu
}

# Connect
connect(){
  ssh root@172.16.42.1
  menu
}
menu
