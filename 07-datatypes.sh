#!/bin/bash

A=10
B=20
C=30
D=Dog

echo "$A+$B+$C+$D"
echo "sum of three numbers are: $(($A+$B+$C+$D))"

MOBILES=("Iphone" "Samsung" "Iqoo" "Realme" "Vivo" "Oppo")

echo "Costily mobile is: ${MOBILES[0]}"
echo "Most trending mobiles brands in the world are: ${MOBILES[@]}"

declare -i NUMBER=15
NUMBER=NUMBER+1
echo "$NUMBER"

NAME="Ande Lakshmi Chenna "
echo "${NAME}Keshava"

#Interger and rthimatic Operations
AGE=26
NEXT_YEAR=$((AGE+1))

echo "My Current Age is: $AGE"
echo "After 1year my age will be: $NEXT_YEAR"
echo "Double the age: $((AGE*2))"

#Decimal Numbers
PRICE=10.5
echo "$PRICE" #shell treats 10.5 as string

echo "10.5 + 12.8" | bc
