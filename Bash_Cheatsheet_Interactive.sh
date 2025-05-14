#!/bin/bash

#Función para controlar el Ctrl_c

function ctrl_c(){
	echo -e "\nSaliendo...\n"
	exit 1
}

trap ctrl_c INT


