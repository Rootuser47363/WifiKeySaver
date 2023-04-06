#!/bin/bash

echo "####################################"
echo "# WifiKeySaver v1.0 #"
echo "# Guarda tus contraseñas #"
echo "# Creado por Rootuser47363 #"
echo "# https://github.com/Rootuser47363 #"
echo "####################################"

# Verificar que el sistema operativo es Linux
if [ "$(uname)" != "Linux" ]; then
    echo "Este script solo se puede ejecutar en un equipo con Linux." >&2
    exit 1
fi

# Cambiar el nombre del archivo de salida aquí:
nombre_archivo="Auto-wifi.txt"

# Verificar si el archivo de salida ya existe y pedir confirmación antes de sobrescribirlo
if [ -f "$nombre_archivo" ]; then
    read -p "El archivo $nombre_archivo ya existe. ¿Desea sobrescribirlo? (S/N) " confirmacion
    if [ "$confirmacion" != "S" ]; then
        echo "Operación cancelada."
        exit 0
    else
        # Leer las contraseñas ya existentes en el archivo y guardarlas en una variable
        contrasenas_existentes=$(cat $nombre_archivo)
    fi
fi

# Ejecutar el comando para obtener las contraseñas y guardarlas en una variable
contrasenas_wifi=""
while read -r red; do
    nombre_red=$(echo "$red" | sed -n 's/^.*:\s\(.*\)$/\1/p')
    contrasena_red=$(sudo cat "/etc/NetworkManager/system-connections/$nombre_red" | sed -n 's/^psk=\(.*\)$/\1/p')
    if [ -n "$contrasena_red" ]; then
        contrasenas_wifi+="\n$nombre_red: $contrasena_red"
    fi
done <<< "$(sudo nmcli --fields NAME con show)"

# Combinar las contraseñas ya existentes con las nuevas, y ordenarlas alfabéticamente por nombre de red
if [ -n "$contrasenas_existentes" ]; then
    todas_contraseñas=$(echo -e "$contrasenas_existentes$contrasenas_wifi" | sort)
else
    todas_contraseñas=$(echo -e "$contrasenas_wifi" | sort)
fi

# Escribir todas las contraseñas en el archivo de salida
if echo -e "$todas_contraseñas" > "$nombre_archivo"; then
    echo "Contraseñas guardadas exitosamente en $nombre_archivo"
else
    echo "Error al escribir en el archivo: $todas_contraseñas" >&2
    exit 1
fi
