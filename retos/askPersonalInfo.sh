# !/bin/bash
# Challenge #2: Program that asks for personal info, to print it afterward

firstName=""
lastName=""
age=0
address=""
phoneNumber=0

echo "============ Type your data ============"
read -p "First Name: " firstName
read -p "Last Name: " lastName
read -p "Age: " age
read -p "Address: " address
read -p "Phone Number: " phoneNumber

echo -e "\n"
echo "============ Personal Data ============"
echo "First Name: $firstName"
echo "Last Name:  $lastName"
echo "Age:        $age"
echo "Address:    $address"
echo "Phone:      $phoneNumber"
echo -e "\n"

