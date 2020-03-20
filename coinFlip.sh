#!/bin/bash -x

declare -A coinArray
declare -A percentage

#constants
ONE_COIN=1;
TWO_COIN=2;
THREE_COIN=3

#variables
randomCoinSide=0;
largest=0;
max=""

#call function coinFlip
function coinFlip(){
	for (( numOfFlip=1;numOfFlip<=$1;numOfFlip++ ))
	do
		coinSide=""
		for (( coins=1;coins<=$2;coins++ ))
		do
			randomCoinSide=$((RANDOM%2))
			if [ $randomCoinSide -eq 0 ]
			then
				coinSide+="T"
			else
				coinSide+="H"
			fi
				coinArray[$coinSide]=$((${coinArray[$coinSide]}+1));
		done
		percentage $coinSide $1
		max=$( maximumCombination $coinSide )
	done
	echo $max;
}

#function for percentage
function percentage(){
	side=$1;
	flip=$2;
	percentage[$side]=$((${coinArray[$side]}*100/$flip));
}

#function for maximum combination
function maximumCombination(){
	if [ $coinArray[$1] > $largest ]
	then
		largest=${coinArray[$1]}
		maxCombination=$1;
		echo $maxCombination
	fi
}

read -p "Enter flips : " flips

singletMax=$( coinFlip $flips $ONE_COIN )
doubletMax=$( coinFlip $flips $TWO_COIN )
tripletMax=$( coinFlip $flips $THREE_COIN )

#displaying winning combination
echo "singlet winning comibination : $singletMax"
echo "doublet winning combination : $doubletMax"
echo "triplet winning combination : $tripletMax"
