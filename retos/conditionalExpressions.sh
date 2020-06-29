# !/bin/bash
# Challenge #3: Conditional expressions usage

option=0

echo "============ Comparator ============"
echo " Choose one of the following options"
echo "1. Compare two numbers."
echo "2. Add two numbers."
echo "3. Compare two strings."
echo "4. Check if path exists."
echo "5. WIP"
read -n1 -p "Type one option:" option
echo ""

case $option in
    [1-2])
        number1=0
        number2=0
        read -p "Number 1: " number1
        read -p "Number 2: " number2
        if [ $option = 1 ]; then
            if [ $number1 -gt $number2 ]; then
                echo "Number 1 is greater than Number 2"
            elif [ $number1 -lt $number2 ]; then
                echo "Number 2 is greater than Number 1"
            else
                echo "Both numbers are equals"
            fi
        else
            echo "$number1 + $number2 = $(($number1 + $number2))"
        fi
        ;;
    3)
        string1=""
        string2=""
        read -p "String 1: " string1
        read -p "String 2: " string2
        if [ $string1 = $string2 ]; then
            echo "Both strings matches"
        else
            echo "Strings are different"
        fi
        ;;
    4)
        pathToFile=""
        read -p "Type the path to the file:" pathToFile
        if [ -d "$pathToFile" ]; then
            echo "The path exists"
        else
            echo "The path '$pathArchivo' could not be found"
        fi
    *) echo "Option not supported"
esac

