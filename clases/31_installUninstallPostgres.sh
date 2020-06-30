#!/bin/bash
# Programa que permite manejar las utilidades de Postres
# Autor: Marco Toscano Freire - @martosfre

opcion=0

# Función para instalar postgres
instalar_postgres () {
    echo -e "\n Verificar instalación postgres ...."
    verifyInstall=$(which psql)
    # $?: Retorna el exit status (0 o 1) del ultimo comando
    if [ $? -eq 0 ]; then
        echo -e "\nPostgres ya se encuentra instalado en el equipo"
    else
        # -s: secret mode, no muestra en pantalla lo ingresado por el usuario.
        read -s -p "Ingresar contraseña de sudo:" password
        echo ""
        read -s -p "Ingresar contraseña a utilizar en postgres:" passwordPostgres
        echo "$password" | sudo -S apt update
        echo "$password" | sudo -S apt -y install postgresql postgresql-contrib
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres$}';"
        echo "$password" | sudo -S systemctl enable postgresql.service
        echo "$password" | sudo -S systemctl start postgresql.service
    fi
    # -r: No permite el normal funcionamiento de caracteres especiales (backslashes)
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

# Función para desinstalar postgres
desinstalar_postgres () {
    read -s -p "Ingresar contraseña de sudo:" password
    echo -e "\n"
    echo "$password" | sudo -S systemctl stop postgresql.service
    echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
    echo "$password" | sudo -S rm -r /etc/postgresql
    echo "$password" | sudo -S rm -r /etc/postgresql-common
    echo "$password" | sudo -S rm -r /var/lib/postgresql
    echo "$password" | sudo -S userdel -r postgres
    echo "$password" | sudo -S groupdel postgresql
    read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
}

# Función para sacar un respaldo
sacar_respaldo () {
    echo -e "Sacar respaldo...\n"
    echo -e "Directorio backup: $1\n"
}

# Función para restaurar un respaldo
restaurar_respaldo () {
    echo -e "Restaurar respaldo...\n"
    echo -e "Directorio respaldo: $1\n"
}

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menú de opciones
    echo "_________________________________________"
    echo "PGUTIL - Programa de Utilidad de Postgres"
    echo "_________________________________________"
    echo "                MENÚ PRINCIPAL           "
    echo "_________________________________________"
    echo "1. Instalar Postgres"
    echo "2. Desinstalar Postgres"
    echo "3. Sacar un respaldo"
    echo "4. Restar respaldo"
    echo "5. Salir"

    #Leer los datos del usuario - capturar información
    read -n1 -p "Ingrese una opción [1-5]: " opcion
    echo ""

    #Validar la opción ingresada
    case $opcion in
        1)
            instalar_postgres
            sleep 3
            ;;
        2)
            desinstalar_postgres
            sleep 3
            ;;
        3)
            read -p "Directorio Backup: " directorioBackup
            sacar_respaldo $directorioBackup
            sleep 3
            ;;
        4)
            read -p "Directorio de Respaldos: " directorioRespaldos
            restaurar_respaldo $directorioRespaldos
            sleep 3
            ;;
        5)
            echo -e "Salir del Programa\n"
            exit 0
            ;;
    esac
done

