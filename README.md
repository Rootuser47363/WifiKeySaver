# WifiKeySaver

WifiKeySaver es un script de shell de Linux que permite guardar las contraseñas de redes Wi-Fi en un archivo de texto.

## Uso

Para usar WifiKeySaver, sigue los siguientes pasos:

1. Descarga el script de WifiKeySaver desde https://github.com/Rootuser47363/WifiKeySaver/
2. Abre una terminal en tu sistema Linux y navega hasta la ubicación donde descargaste el archivo de script.
3. Ejecuta el script con el siguiente comando:

   ```
   bash WifiKeySaver.sh
   ```

4. Sigue las instrucciones que aparecen en pantalla para guardar las contraseñas de Wi-Fi.

## Funcionamiento del script

El script funciona de la siguiente manera:

1. El script comienza imprimiendo un encabezado que indica su nombre y versión, así como el nombre del creador y el enlace a su perfil de GitHub.

2. A continuación, el script verifica si el sistema operativo es Linux, y si no lo es, muestra un mensaje de error y sale.

3. Luego, el script le permite al usuario especificar el nombre del archivo de salida en el que se guardarán las contraseñas de Wi-Fi. Si el archivo ya existe, el script pide al usuario una confirmación antes de sobrescribirlo. Si el usuario no confirma la operación, el script sale.

4. Después, el script utiliza el comando "nmcli" para obtener las contraseñas de Wi-Fi y las guarda en una variable.

5. El script también verifica si ya existen contraseñas guardadas en el archivo de salida especificado. Si es así, las lee del archivo y las guarda en otra variable.

6. El script combina las contraseñas nuevas y existentes en una sola variable y las ordena alfabéticamente por el nombre de red.

7. Finalmente, el script escribe todas las contraseñas en el archivo de salida especificado.

## Actualizaciones del código

Aquí están las actualizaciones del código de WifiKeySaver:

- Se agregó una comprobación al principio del script para verificar si el usuario tiene permisos de superusuario. Si no los tiene, se solicita que se ejecute el script como superusuario.

- Se agregó una opción para mostrar las contraseñas guardadas en la pantalla antes de guardarlas en el archivo de salida.

- Se agregó una opción para ordenar las contraseñas por tipo de seguridad de red (WEP, WPA, etc.).

- Se agregó una opción para mostrar solo las contraseñas de redes Wi-Fi a las que se ha conectado el usuario.

- Se corrigió un error que hacía que el script guardara las contraseñas en un archivo de salida sin extensiones.

- Se mejoró la legibilidad y la claridad del código.

¡Gracias por utilizar WifiKeySaver! Si tienes alguna pregunta o comentario, no dudes en ponerte en contacto conmigo a través de mi perfil de GitHub.
