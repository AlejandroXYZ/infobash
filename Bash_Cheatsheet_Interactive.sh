#!/bin/bash

# Mi Primer Proyecto creado aprendiendo bash linux
# Autor : Alejandro Moncada
# Github : AlejandroXYZ 


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

# Desinstalacion del programa
elif [[ $1 == "--desinstall" ]]; then
	echo "Estas seguro de que deseas Desinstalar el programa?"
	read -p "Escribe tu respuesta, si o no:   " respuesta
	if [[ $respuesta == "si" || $respuesta ==  "s" ]]; then
		echo -e "\n\nEliminando...\n\n"
		sudo rm -f /local/usr/bin/infobash 
		sudo rm -rf /opt/bash_cheat_sheet
		sleep 2
		exit 0
	elif [[ $respuesta == "no" || $respuesta == "n" ]]; then
		ctrl_c
		exit 1
	fi

# Panel de Ayuda
elif [[ $1 == "-h" || "--help" ]]; then
	glow -p help.md

else
	echo "No se encontró ese comando"
	exit 1

fi
exit 0
