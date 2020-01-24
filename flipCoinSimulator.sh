#!/bin/bash -x

echo "Welcome to flip-Coin-Simulator"

if [ $((RANDOM%2)) -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi

