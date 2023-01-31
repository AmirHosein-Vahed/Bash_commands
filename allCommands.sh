#!/bin/bash

################################################# FOR
for arg in "amir saeed reza"
do
	echo "..."
done
#-------------------------------------------
for num in {1..10}
do
	echo $num
done
#-------------------------------------------
for (( i=0; i<=10; i++ ))
do
	echo $i
done
#-------------------------------------------
for file in *.txt
do
	echo $(date) >> $file
	ps -ef | head -5 >> $file
	echo "============" >> $file
done
#-------------------------------------------
counter=1
for arg in $@
do
	echo "$counter.$arg"
	let counter++
done
################################################# WHILE
while [ "$name" != "stop" ]
do
	echo -n "Enter name"
	read name
done
#-------------------------------------------
a=1
limit=10
while (( a < limit ))
do
	touch $a
	let a++
done
################################################# IF
if [ "a" = "a" ]; then
	echo "a=a"
elif [ "a" = "b" ]; then
	echo "a=b"
else
	echo "else"
fi
#-------------------------------------------
if [ "" = "" ] && [ "a" = "a" ] ; then
	echo "something"
fi
#-------------------------------------------
# -eq --> equal to
# -ne --> not equal to
# -gt --> greater than
# -lt --> less than
# -ge --> greater equal to
# -le --> less equal to
#-------------------------------------------
if [ $# -ne 1 ]; then
	echo "one argument needed"
	exit 1
fi
if [ ! -f "$1" ]; then
	echo "Error"
	exit 2
fi
filename=$1
count=1
while read line
do
	echo "$count.$line"
	let count++
done < "filename"
#-------------------------------------------
file=$1
if [ -f "$file" ]; then
	var_read="NO"
	var_write="NO"
	var_exec="NO"
	if [ -r "$file" ]; then
		var_read="YES"
	fi
	if [ -w "$file" ]; then
		var_write="YES"
	fi
	if [ -x "$file" ]; then
		var_exec="YES"
	fi
	echo "Readable : $var_read"
	echo "Writable : $var_write"
	echo "Executable : $var_exec"
else
	if [ -d "$file" ]; then
		echo "is directory"
	fi
fi
################################################# CASE
case "$(whoami)" in
	"root" )
		echo "Root user"
		;;
	"ahosein" | "amirmahdi" )
		echo "Normal user"
		;;
	* )
		echo "i don't know you!"
		;;
esac
#-------------------------------------------
echo -n "your name: "
read name
$name >> tmp.txt
################################################# ARRAY
array=($(ls *.txt))
count=0
for file in "${array[@]}"
do
	echo -n "[${#array[$count]}]"
	if [ -w "$file" ]; then
		echo -e "\t yes"
	else
		echo -e "\t no"
	fi
	
	let count++
done
#-------------------------------------------
array=(val1 val2 val3)
array=(val1 , val2 , val3)
${array[0]} # --> val1
${array[1]} # --> val2
${array[@]} # --> all items
#       *
${#array[@]} # --> number of items in array
${#array[0]} # --> length of item 0
################################################# FUNCTION
function hello {
	echo "salam $1"
	return 11
}
hello amir
echo "returned value of hello function : $?"
#-------------------------------------------
hello() {
	local name=$1
	echo "hello $name"
}
echo -n "Enter name: "
read name

hello saeed
echo $name
################################################# SHIFT
echo "before shift : "
echo "1: $1"
echo "2: $2"
echo "3: $3"

shift

echo "1: $1"
echo "2: $2"
echo "3: $3"
################################################# WILDCARD
# ? : hel? --> hell, help, hel
# * : ca*  --> cat, catter, ca
# []: file[0-9] --> file1, file2
# {}: {*.txt , *.pdf} --> book.txt, book.pdf
# [[:digit:]]
# [[:alpha:]]
# [[:upper:]]
# [[:lower:]]
# [[:alnum:]]
#   [[ $string == pattern ]]
################################################# REGEX
# .   :bo.k              --> bool, bolk
# *   :co*l              --> cl, col, cool, coool
#         .*             --> k, kijsdadas
# ^   :^winter           --> winter is comming
# $   :comming$          --> winter is commming
# []  :coo[lk]           --> cool, cook
# [-] :file[1-3]         --> file1, file2, file3 
# [^] :file[^0123456789] --> file8, file9
# ?   :colou?r           --> color, colour
# +   :file1+            --> file1, file11, file11111
# {n} :[0-9]{3}          --> 111, 234, 454
# {n,}:[0-9]{4,}         --> 1111, 232323232323456
#{n,m}:[0-9]{3,4}        --> 222, 4444, 123, 1234
# \   :\.                --> hello.o
#           [[ $string =~ $regex ]]
#-------------------------------------------
IPregex="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[[:digit:]]{1,3}"
if [[ $1 =~ $IPregex ]]; then
	echo "matched"
	IP=${BASH_REMATCH[0]}
	ping -c4 $IP 1> log.txt
	
	if [ $? -eq 0 ]; then
		echo "alive"
	else
		echo "dead"
	fi
fi
################################################# AWK
awk 'BEGIN{print "begin...\n"} {print NR " " NF} END{print "end..."}' inputfile.txt
# NR --> Number of Records
# NF --> Number of Fields
# RS --> Record Separator
# FS --> Field Separator
# $1, $2, $3
# $0 --> all data of record
cat table.txt | awk 'BEGIN{FS=","} {print $0}'
cat table.txt | awk '{if ($1 == "Amir") {print $0}}'

################################################# SED
# sed '21,43d' input.txt > res.txt
# d --> delete
# a text --> append text after line
# i text --> insert text before line
# q2 --> quit with status 2
# p --> print

# -n --> disable automatic printing
# -e --> add script
sed '/IT/a phone number = 123344' table.txt
sed 's/IT/InforTech' table.txt
echo "amir is 24 years old" | sed 's/[[:digit:]]\+/***/' #---> amir is *** years old
################################################# MATH
number=7
let res=number++ -- +=2
res=$(( number + 5 ))
res=$[ $number + 3 ]
################################################# OTHERS
read -p "your name : " name
read -sp "youe password" pass
echo "all args: " $@
echo "count of all args: " $#
#-------------------------------------------
