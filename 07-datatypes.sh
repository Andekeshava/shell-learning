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

declar -i num=5
num=num+1
echo "$num"