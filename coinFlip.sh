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
	done
	echo "${!percentage[@]}  : ${percentage[@]}"
}

function percentage(){
	side=$1;
	flip=$2;
	percentage[$side]=$((${coinArray[$side]}*100/$flip));
}

read -p "Enter flips : " flips

singletMax=$( coinFlip $flips $ONE_COIN )
doubletMax=$( coinFlip $flips $TWO_COIN )
tripletMax=$( coinFlip $flips $THREE_COIN )


