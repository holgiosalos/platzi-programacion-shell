# !/bin/bash
# Programa para ejemplificar el uso de la sentencia case
# Autor: Marco Toscano Freire - @martosfre

opcion=""

echo "Ejemplo Sentencia Case"
read -p "Ingrese una opción de la A - Z:" opcion

case $opcion in
    "A") echo -e "\nOperación Guardar Arhivo";;
    "B") echo "Operación Eliminar Archivo";;
    [C-E]) echo "No esta implementada la operación";;
    "*") echo "Opción Incorrecta"
esac

