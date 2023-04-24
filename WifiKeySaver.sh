#!/bin/bash

echo "####################################"
echo "# WifiKeySaver v1.0 #"
echo "# Guarda tus contraseñas #"
echo "# Creado por Rootuser47363 #"
echo "# https://github.com/Rootuser47363 #"
echo "####################################"

# Función para instalar dependencias
install_deps() {
    echo "Instalando dependencias..."
    if [ -f /etc/debian_version ]; then
        # Debian, Ubuntu
        sudo apt-get update
        sudo apt-get install -y sudo nmcli sed sort echo
    elif [ -f /etc/redhat-release ]; then
        # Red Hat, CentOS, Fedora
        if grep -q "CentOS Linux release 8" /etc/redhat-release; then
            sudo dnf update
            sudo dnf install -y sudo nmcli sed sort echo
        else
            sudo yum update
            sudo yum install -y sudo nmcli sed sort echo
        fi
    elif [ -f /etc/arch-release ]; then
        # Arch Linux
        sudo pacman -S sudo nmcli sed sort echo
    elif grep -q "Kali" /etc/os-release; then
        # Kali Linux
        sudo apt-get update
        sudo apt-get install -y sudo nmcli sed sort echo
    elif grep -q "Parrot" /etc/os-release; then
        # Parrot OS
        sudo apt-get update
        sudo apt-get install -y sudo nmcli sed sort echo
    elif [ -f /etc/SuSE-release ] || [ -f /etc/SUSE-brand ] || [ -f /etc/SUSE-release ]; then
        # SUSE Linux
        sudo zypper refresh
        sudo zypper install -y sudo nmcli sed sort echo
    elif [ -f /etc/alpine-release ]; then
        # Alpine Linux
        sudo apk update
        sudo apk add sudo nmcli sed sort echo
    elif [ "$(uname)" == "Darwin" ]; then
        # macOS
        echo "No se pueden instalar las dependencias automáticamente en macOS. Por favor, instale manualmente las siguientes dependencias: sudo, nmcli, sed, sort, echo."
        exit 1
    else
        echo "Error: No se pudo detectar el sistema operativo. Por favor, instale manualmente las siguientes dependencias: sudo, nmcli, sed, sort, echo."
        exit 1
    fi
    echo "Las dependencias se han instalado correctamente."
}

# Verificar que el usuario tiene permisos de sudo
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecute el script como usuario root o con permisos de sudo." >&2
    exit 1
fi

# Verificar que el sistema operativo es Linux
if [ "$(uname)" != "Linux" ]; then
    echo "Este script solo se puede ejecutar en un equipo con Linux." >&2
    exit 1
fi

# Instalar dependencias si no están instaladas
if ! [ -x "$(command -v sudo)" ] || ! [ -x "$(command -v nmcli)" ] || ! [ -x "$(command -v sed)" ] || ! [ -x "$(command -v sort)" ] || ! [ -x "$(command -v echo)" ]; then
    install_deps
fi

# Cambiar el nombre del archivo de configuración de NetworkManager
sudo mv /etc/NetworkManager/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf.backup
echo "Archivo de configuración de NetworkManager respaldado como /etc/NetworkManager/NetworkManager.conf.backup"

# Obtener la lista de conexiones
echo "Obteniendo la lista de conexiones..."
connections=$(nmcli connection show | awk -F "  " '{print $1}' | sed '/^NAME/d' | sort)

# Verificar si hay conexiones con el mismo nombre
duplicate_connections=$(echo "$connections" | uniq -d)

if [ -z "$duplicate_connections" ]; then
  echo "No hay conexiones con el mismo nombre."
else
  echo "Las siguientes conexiones tienen el mismo nombre:"
  echo "$duplicate_connections"
fi

# Cambiar el nombre de las conexiones duplicadas
if [ -n "$duplicate_connections" ]; then
  while read connection; do
    echo "Cambiando el nombre de la conexión $connection"
    nmcli connection modify "$connection" connection.id "$connection-duplicated"
  done <<< "$duplicate_connections"
fi

echo "Proceso completado."
