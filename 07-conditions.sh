#!/bin/bash

Number=$1

if [$Number -gt 10]
then
    echo "Entered number $Number is greater than 10"
else
    eho "Entered number $Number is less than 10"
fi
