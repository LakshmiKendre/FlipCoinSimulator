#!/bin/bash -x

echo "Welcome to flip-Coin-Simulator"

#declaring dictionary
declare -A Dictionary 

#declaring variables
H=0
T=0

# function to flip coin and taking count of heads and tails
flip_coin()
{
read -p "Enter how many time you want to flip coin : " flipCoin

for((i=0;i<flipCoin;i++))
do
	if [ $((RANDOM%2)) -eq 0 ]
	then
		Dictionary[$i]="Heads" # storing result in dictionary
		let H++
	else
		Dictionary[$i]="Tails"
		let T++
	fi
done
}

# calling function
flip_coin

# calculating percentage of heads and tails and print it
echo "Heads percentage :" $(echo "scale=2; $H*100/$flipCoin " | bc)
echo "Tails percentage :" $(echo "scale=2; $T*100/$flipCoin " | bc)

echo Number of flips of coin : ${Dictionary[@]}
