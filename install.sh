#!/bin/bash

# Instalador de herramientas necesarias para poder ejecutar el programa correctamente


sistema_operativo=$(grep '^NAME=' /etc/os-release|cut -d '"' -f 2|cut -d " " -f 1)
ruta_de_instalacion="/opt/bash_cheat_sheet"

banner(){
	echo -e "\n\n\n"
	cat .banner.ascii
}

if [[ $UID != 0 ]];then
	echo -e "¸\n\n Ejecuta como root para instalar el programa\n\n"
	exit 1
fi

banner
echo -e "\n\nINSTALANDO, POR FAVOR ESPERE...\n "
echo -e "Tienes 5 segundos para cancelar con ctrl_c"
sleep 5

if [[ $sistema_operativo == "Arch" || "arch" ]];then
	echo -e "\n\nEstas usando Arch Linux\n\n"
	which glow > /dev/null
	if [[ $? -ne 0 ]]; then
		pacman -Sy --noconfirm glow > /dev/null  && echo "Se ha instalado correctamente"|sleep 2 || echo "Error al instalar"| sleep 3| exit 1
	fi
	if [[ -f /usr/local/bin/infobash ]];then
		echo -e "\nEl Programa ya existe y no se instalará, desinstala primero el que esta creado"
		exit 1
	fi	
	mkdir $ruta_de_instalacion 2>/dev/null|| echo -e "\nno se Pudo crear la carpeta o ya existe\n"| sleep 2 | exit 1
	cp -r ./* $ruta_de_instalacion || echo -e "\nNo se pudieron copiar los archivos\n"| exit 1 && echo -e "\nSe copiaron los arcchivos correctamente\n"  | sleep 3
	chmod u+x $ruta_de_instalacion/Bash_Cheatsheet_Interactive.sh || echo -e "\nNo se pudo añadir Permisos\n" && echo -e "\nse añadieron los permisos correctamente\n"| sleep 3
	ln -s $ruta_de_instalacion/Bash_Cheatsheet_Interactive.sh  /usr/local/bin/infobash 2>/dev/null || echo -e "\nNo se Pudo hacer el enlace Simbólico o ya existe\n" && echo -e "\nSe creó el enlace\n" | sleep 3 
	echo -e "\nSE HA INSTALADO TODO CORRECTAMENTE\n"
	echo -e "\nPara empezar a utilizarlo utiliza el comando infobash y el comando que quieres ejecutar, ejemplo:\n\ninfobash awk\n\nEsto te mostrara informacion sobre el comando, tambien puedes usar: \n\n infobash -h o infobash --help\n\n  Con esto obtendrás ayuda"
	exit 0
else 
	echo -e "\n\nEstas usando un linux base Debian\n\n"
	apt update && apt install glow
	sleep 2
fi


