# WifiKeySaver

WifiKeySaver es un script de shell de Linux que permite guardar las contraseñas de redes Wi-Fi en un archivo de texto. A continuación se describe el funcionamiento general del script:

1. El script comienza imprimiendo un encabezado que indica su nombre y versión, así como el nombre del creador y el enlace a su perfil de GitHub.

2. A continuación, el script verifica si el sistema operativo es Linux, y si no lo es, muestra un mensaje de error y sale.

3. Luego, el script le permite al usuario especificar el nombre del archivo de salida en el que se guardarán las contraseñas de Wi-Fi. Si el archivo ya existe, el script pide al usuario una confirmación antes de sobrescribirlo. Si el usuario no confirma la operación, el script sale.

4. Después, el script utiliza el comando "nmcli" para obtener las contraseñas de Wi-Fi y las guarda en una variable.

5. El script también verifica si ya existen contraseñas guardadas en el archivo de salida especificado. Si es así, las lee del archivo y las guarda en otra variable.

6. El script combina las contraseñas nuevas y existentes en una sola variable y las ordena alfabéticamente por el nombre de red.

7. Finalmente, el script escribe todas las contraseñas en el archivo de salida especificado.

El script está escrito en Bash, un lenguaje de programación de shell de Unix/Linux. Puede ser ejecutado en cualquier terminal de Linux que tenga Bash instalado.
