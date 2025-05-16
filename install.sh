#!/bin/bash

# Instalador de herramientas necesarias para poder ejecutar el programa correctamente

trap 'rm -rf "$ruta_de_instalacion"; exit 1' ERR

sistema_operativo=$(grep '^NAME=' /etc/os-release|cut -d '"' -f 2|cut -d " " -f 1)
ruta_de_instalacion="/opt/bash_cheat_sheet"

banner(){
	echo -e "\n\n\n"
	cat .banner.ascii
}

instalador(){
	if [[ -f /usr/local/bin/infobash ]]; then
		echo -e "\nEl Programa ya existe y no se instalará, desinstala primero el que esta creado"
		exit 1
	fi
	if mkdir $ruta_de_instalacion 2>/dev/null ; then
		echo -e "\nCrearon las carpetas correctamente\n" 
	else
		echo -e "\nNo se pudo crear la carpeta o ya existe\n"
		exit 1
	fi
	if cp -r ./* "$ruta_de_instalacion" ; then
		echo -e "\nSe copiaron los archivos correctamente\n"
	else
		echo -e "\nNo se pudieron copiar los archivos\n"
		exit 1	
	fi		
	if chmod u+x $ruta_de_instalacion/infobash.sh ; then
		echo -e "\nSe asignaron los permisos correctamente\n"
	else
		echo -e "\nError al asignar los permisos\n"
		exit 1
	fi
	if ln -s $ruta_de_instalacion/infobash.sh /usr/local/bin/infobash 2>/dev/null ; then
		echo -e "\nse creo el enlace simbolico satisfactoriamente\n"
	else
		echo -e "\nNo se pudo hacer el enlace simbolico o ya existe\n"
	fi 
	echo -e "\nSE HA INSTALADO TODO CORRECTAMENTE\n"
	echo -e "\nPara empezar a utilizarlo utiliza el comando infobash y el comando que quieres ejecutar, ejemplo:\n\ninfobash awk\n\nEsto te mostrara informacion sobre el comando, tambien puedes usar: \n\n infobash -h o infobash --help\n\n  Con esto obtendrás ayuda"
	exit 0
}

if [[ $UID != 0 ]];then
	echo -e "¸\n\n Ejecuta como root para instalar el programa\n\n"
	exit 1
fi

banner
echo -e "\n\nINSTALANDO, POR FAVOR ESPERE...\n "
echo -e "Tienes 5 segundos para cancelar con ctrl_c"
sleep 5

if [[ $sistema_operativo == "Arch" || $sistema_operativo == "arch" ]];then
	echo -e "\n\nEstas usando Arch Linux\n\n"
	if ! command -v glow >/dev/null ; then
		if pacman -Sy --noconfirm glow > /dev/null ; then
		 echo "Se ha instalado correctamente"
		 sleep 2 
		else
			echo "Error al instalar"
			 exit 1
		fi
	fi
	instalador
else 
	echo -e "\n\nEstas usando un linux base Debian\n\n"
	if ! command -v glow  >/dev/null ; then
		if apt update >/dev/null ; then
		  apt install glow -y >/dev/null
		else
			 echo -e "\nError al instalar glow\n"
			 exit 1
		fi
	fi
	instalador
fi


