#!/bin/bash
# Challenge #7: Utility Host program

option=0
backupDir="$(pwd)/utilityLogs"
logFileSufix="`date +%Y%m%d%H%M%S`.log"

mkdir $backupDir

currentProcesses(){
    echo -e "\nCurrent Processes....."
    processesLogFilename="$backupDir/processes-$logFileSufix"
    ps aux >> $processesLogFilename
    cat $processesLogFilename
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

availableMemory(){
    echo -e "\nAvailable Memory...."
    availableMemoryLogFilename="$backupDir/memory-$logFileSufix"
    free -m >> $availableMemoryLogFilename
    cat $availableMemoryLogFilename
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

diskSpace(){
    echo -e "\nDisk Space..."
    diskLogFilename="$backupDir/disk-$logFileSufix"
    df -h >> $diskLogFilename
    cat $diskLogFilename
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

networkInfo(){
    echo -e "\nNetwork Information..."
    networkLogFilename="$backupDir/network-$logFileSufix"
    ifconfig >> $networkLogFilename
    cat $networkLogFilename
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

configuredEnvVars(){
    echo -e "\nConfigured Environment Variables..."
    envVarsLogFilename="$backupDir/envVars-$logFileSufix"
    printenv >> $envVarsLogFilename
    cat $envVarsLogFilename
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

programInfo(){
    echo -e "\nProgram Information..."
    echo -e "Utility program to get info about:" 
    echo "1. Current running processes"
    echo "2. Available memory in system"
    echo "3. Disk usage"
    echo "4. Networking information"
    echo "5. Current configured environment variables"
    echo "6. Print this information"
    echo "7. Backup of the generated info in each option"
    echo "All options store log files data on the following dir: $backupDir"
    echo "Backup option compress the logs dir in one single file."
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

backupInfo(){
    echo -e "\nBackup Information..."
    tar -cvf backupInfo.tar $backupDir/*.log
    gzip backupInfo.tar
    if [ $? -eq 0 ]; then
        echo "Backup successfully generated..."
    else
        echo "Error creating backup file"
    fi
    read -n 1 -s -r -p "Presiones [ENTER] para continuar..."
}

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
        1) currentProcesses;;
        2) availableMemory;;
        3) diskSpace;;
        4) networkInfo;;
        5) configuredEnvVars;;
        6) programInfo;;
        7) backupInfo;;
        8)
            echo -e "\nExit Program\n"
            exit 0
            ;;
    esac
done
