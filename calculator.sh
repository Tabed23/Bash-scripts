#!/bin/bash

n1=$1
n2=$2

select opt in Add Sub Mul Div quit
do
	case $opt in
		Add)
			echo -e "sum of $n1 and $n2: $(( $n1 + $n2 )) \n"
			;;
		Sub)
			 echo -e "subtract of $n1 from $n2: $(( $n1 - $n2 )) \n"
                        ;;	
		Mul)
			 echo -e "Multiply  $n1 with $n2: $(( $n1 * $n2 )) \n"
                        ;;
		Div)
			 echo -e "Divide  $n1 by $n2: $(( $n1 / $n2 )) \n"
                        ;;
		*)
			echo -e "invalid option \n"
			;;
		quit)
			echo -e " thank you for using the calculator \n"
			exit 0
			;;
	esac
done
