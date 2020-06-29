#!/bin/bash
# Challenge #4: Print an options menu.

option=0

while :
do
    #Clearing screen
    clear
    #Printing the menu
    echo "______________________________________"
    echo "Challenge 4 - Printing an Options Menu"
    echo "______________________________________"
    echo "               MAIN MENU              "
    echo "______________________________________"
    echo "1. Current Processes"
    echo "2. Available Memory"
    echo "3. Disk space"
    echo "4. Network Information"
    echo "5. Configured Environment Variables"
    echo "6. Program Information"
    echo "7. Backup information"
    echo "8. Exit"

    # Capturing user information
    read -n1 -p "Please enter an option [1-8]:" option

    #Checking the entered option
    case $option in
        1)
            echo -e "\nCurrent Processes....."
            sleep 3
            ;;
        2)
            echo -e "\nAvailable Memory...."
            sleep 3
            ;;
        3)
            echo -e "\nDisk Space..."
            sleep 3
            ;;
        4)
            echo -e "\nNetwork Information..."
            sleep 3
            ;;
        5)
            echo -e "\nConfigured Environment Variables..."
            sleep 3
            ;;
        6)
            echo -e "\nProgram Information..."
            sleep 3
            ;;
        7)
            echo -e "\nBackup Information..."
            sleep 3
            ;;
        8)
            echo -e "\nExit Program\n"
            exit 0
            ;;
    esac
done

