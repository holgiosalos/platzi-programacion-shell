# !/bin/bash
# Programa para ejemplificar como capturar la información del usuario y validarla
# Autor: Marco Toscano Freire - @martosfre

option=0
backupName=""
clave=""

echo "Programa Utilidades Postgres"
# -n1: Acepta el ingreso de información de solo un caracter.
# Importante: Cuando se usa el parametro -n, no se le permite borrar o modificar la informacion al usuario
read -n1 -p "Ingresar una opción:" option
echo -e "\n"
read -n10 -p "Ingresar el nombre del archivo del backup:" backupName
echo -e "\n"
echo "Opción:$option , backupName:$backupName"
# -s: no muestra la informacion que ingresa el usuario 
read -s -p "Clave:" clave
echo "Clave: $clave"

