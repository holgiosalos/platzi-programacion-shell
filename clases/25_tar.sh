#!/bin/bash
# Programa para ejemplificar el empaquetamiento con el comando tar
# Autor: Marco Toscano Freire - @martosfre

echo "Empaquetar todos los scripts de la carpeta shellCourse"
# c: crear, v: verbose, f: file
tar -cvf shellCourse.tar *.sh

