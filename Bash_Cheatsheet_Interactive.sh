#!/bin/bash

#Función para controlar el Ctrl_c

function ctrl_c(){
	echo -e "\nSaliendo...\n"
	exit 1
}

trap ctrl_c INT


#Funcion del Banner

function banner(){
	cat .banner.ascii	                                                                                       
}

# Mostrar Menù y  Seleccionar Opciones

function menu(){
	clear
	banner
	echo -e  "\n\n=============Menú de Opciones=================\n\n"
	echo -e "\n1) Buscar un Comando especìfico\n"
	echo -e "\n2) Mostrar todos los comandos Aprendidos\n"
	echo -e "\n3) Salir \n"
	echo -e "\n===================================================\n"
	
}

## Funcion para realizar la busqueda del comando

function busqueda(){
	   echo -e "\n"
		cd ./commands
		echo -e "=================LISTA DE COMANDOS=========================="
		ls | awk -F "." '{ print $1 }'
		echo ""
	   read -e -p "Sobre que comando quieres saber:   " comando
	   echo -e "\n\n"
}




# Validando Selección
if [[ $# == 0 ]];then

while true; do

menu

read -p "Selecciona lo que deseas realizar:  " selec

case $selec in
	
	1)
	   busqueda  
	   if [ -f $comando.md ];then
	   		find ./ -iname "$comando.md" | xargs glow -p
	   		cd ..
	   		sleep 1
	   		menu
	  else
	  		echo -e "\nEse comando no está en la lista\n\n"
	  		sleep 1
	  		cd ..
	  		busqueda
	  		
	  fi

	;;
	2) echo "Has seleccionado la Opción 2"
	;;
	3) ctrl_c
	;;
esac

done

# Funciones desde la terminal, parecido a man

elif [[ -f ./commands/$1.md ]];then
	find . -iname "$1.md" | xargs glow -p
	cd ..
	exit 0 
else
	echo "No se encontró ese comando"
	exit 1
fi
exit 0

