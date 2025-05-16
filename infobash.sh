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
banner(){
	cat .banner.ascii	                                                                                       
}

lista(){
		clear
		echo -e "\n"
		echo -e "=================LISTA DE COMANDOS=========================="
		ls ./commands | awk -F "." '{ print $1 }'
}
## Funcion para realizar la busqueda del comando

busqueda(){
	   lista
	   echo ""
	   echo -e "\nEscribe \"salir\" o \"atras\" para volver al menu anterior\n"
	   read -e -p "Sobre que comando quieres saber:   " comando
	   if [[ $comando == "salir" || $comando == "atras" ]]; then
	   	 menu
	   fi
	   echo -e "\n\n"
}


# Mostrar Menù y  Seleccionar Opciones

menu(){
		# Validando Selección
		if [[ $# == 0 ]];then
		while true; do
		clear
		banner
		echo -e  "\n\n=============Menú de Opciones=================\n\n"
		echo -e "\n1) Buscar un Comando especìfico\n"
		echo -e "\n2) Salir\n"
		echo -e "\n===================================================\n"
		read -p "Selecciona lo que deseas realizar:  " selec
		case $selec in
			1)
		   	busqueda  
		   		if [ -f ./commands/$comando.md ];then
		   			find ./commands/ -iname "$comando.md" | xargs glow -p
		   			sleep 1
		   			menu
		  		else
		  			echo -e "\nEse comando no está en la lista\n\n"
		  			sleep 1
		  			busqueda
		  		fi
			;;		
			2) ctrl_c
			;;
		esac
		done
		fi
}

# Funciones desde la terminal, parecido a man
if [[ -f ./commands/$1.md ]];then
	find . -iname "$1.md" | xargs glow -p
	cd ..
	exit 0 
fi
	
# Desinstalacion del programa
if [[ $1 == "--desinstall" ]]; then
	echo "Estas seguro de que deseas Desinstalar el programa?"
	read -p "Escribe tu respuesta, si o no:   " respuesta
	if [[ $respuesta == "si" || $respuesta ==  "s" ]]; then
		echo -e "\n\nEliminando...\n\n"
		sudo rm -f /usr/local/bin/infobash 
		sudo rm -rf /opt/bash_cheat_sheet
		sleep 2
		exit 0
	elif [[ $respuesta == "no" || $respuesta == "n" ]]; then
		ctrl_c
		exit 1
	fi

# Panel de Ayuda
elif [[ $1 == "-h" || $1 ==  "--help" ]]; then
	glow -p help.md

elif [[ $# > 0 ]]; then
	echo -e "\nNo se reconoce el Parametro dado, ejemplos de uso: \n\ninfobash   (Muestra el menu de opciones)\ninfobash -h   o   infobash --help   (Muestra el Panel de Ayuda)\ninfobash --desinstall (Desistalar el programa) "
else
	menu
	exit 1
fi
exit 0
