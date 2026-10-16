#!/bin/bash

echo "Please enter your marks: "
read marks

if [ $marks -gt 80 ]; then
    echo "outstanding"
elif [ $marks -gt 70 ]; then
    echo "1st class"
elif [ $marks -gt 60 ]; then
    echo "2nd class"
elif [ $marks -gt 50 ]; then
    echo "3rd class"
elif [ $marks -gt 36 ]; then
    echo "Just pass"
else
    echo "fail"
fi 