#!/bin/bash


function mk_str {

	local str=$1
	local conf_file=~/opbin/wwy/conf/slist_all.conf

	idcn=`echo $str | awk -F- '{print $1}'`
	pron=`echo $str | awk -F- '{print $2}'`
	modn=`echo $str | awk -F- '{print $3}'`
	sern=`echo $str | awk -F- '{print $4}'`
	[ "$idcn" == "*" ] && idcn='.*'
	[ "$pron" == "*" ] && pron='.*'
	[ "$modn" == "*" ] && modn='.*'
	[ "$sern" == "*" ] && sern='.*'

	awk '$1~/'$sern'/ && $2~/\<'$idcn'\>/ && $3~/\<'$pron'\>/ && $4~/\<'$modn'\>/ && $1!~/^#|^$/{print $1}' $conf_file
}


str=${1:-"*-*-*-*"}
echo "$str" | grep -q '[a-zA-Z,*][a-zA-Z,*]*-[a-zA-Z,*][a-zA-Z,*]*-[a-zA-Z,*][a-zA-Z0-9,*]*-[0-9,*][0-9,*]*' || {
	echo "\"$str\", tpye is wrong !"
	exit 1
}

serl=(
	`mk_str $str`
)

#echo -n "${serl[@]}"
for ((i=0;i<${#serl[@]};i++));do
	echo "${serl[$i]}"
done
