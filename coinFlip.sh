#!/bin/bash -x

echo "Welcome to coin flip simulator"

randomCoinSide=$((RANDOM%2))

if [ $randomCoinSide -eq 0 ]
then
	echo "tails"
else
	echo "head"
fi 
