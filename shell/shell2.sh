echo Systemisupandrunning
#comment
echo $1
echo $2
echo $*
echo $#

sum=$(($1 * $2))
echo $sum

age=29
if [ $age -gt 15 ]
	then
		echo "Greater than 15"
	else
		echo "Less than 15"
	fi

for var2 in "$@"
do 
echo "$var2"
done

for i in {1..5}
do 
	echo $i
done

for i in 1 2 3
do 
echo $i
done