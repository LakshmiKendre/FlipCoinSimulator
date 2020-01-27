#!/bin/bash

echo "Welcome to flip-Coin-Simulator"

#declaring variables
H=0
T=0

# fuction to flip coins as per users requirement
flip_coin()
{
#declaring dictionary
declare -A Dictionary 

echo -e "Enter how many flips do you want: \c"
read flips

for((i=0;i<flips;i++))
do
	key=""
	for((j=0;j<$1;j++))
	do
		if (( $((RANDOM%2))==1 ))
		then
			key=$key"H"
		else
			key=$key"T"
		fi
	done
	Dictionary[$key]=$((${Dictionary[$key]}+1))
done

echo "Dictionary key : " ${!Dictionary[@]} 
echo "Dictionary value : " ${Dictionary[@]}
percentage

}

# function to calculate percentage 
percentage()
{
for i in ${!Dictionary[@]}
do
        Dictionary[$i]=$(echo "scale=2;${Dictionary[$i]} * 100 / $flips" | bc)
done
echo "percentage: ${Dictionary[@]}"
echo "Winning Combination: $(sorting)"

}

sorting()
{
	for i in ${!Dictionary[@]}
	do
		echo $i ${Dictionary[$i]}
	done | sort -rn -k2 | head -n 1 
}

# loop statement to take users choice
ans=1
while (( ans == 1 ))
do
	echo "1.Singlet"
	echo "2.Doublet"
	echo "3.Triplet"
	read choice	

		case $choice in
		1)
			flip_coin 1
			;;
		2)
			flip_coin 2
			;;
		3)
			flip_coin 3
			;;
		*)
			echo Invalid Choice
			;;
		esac

	echo -e "Do you want to Continue..?\n press 1->yes/ press 0->no "
	read ans
done
