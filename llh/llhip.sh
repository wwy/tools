#!/bin/bash


trap break 2

LLH_CMD=~/opbin/wwy/bin/llh.sh
ssh_str="$1"
ssh_cmd="$2"

server_list=(
	`$LLH_CMD $1`
) || {
	echo ${ssh_server_list[@]}
	exit 1
}


for ((i=0;i<${#server_list[@]};i++));do

	printf "\033[0;36;40m%3d\033[1;30;40m: =============== \033[0;33;40m%-18s \033[1;30;40m===============\033[0m\n" $i ${server_list[$i]}
	ssh -n "${server_list[$i]}" "{ /sbin/ifconfig eth0 && /sbin/ifconfig eth1;} | awk '/inet/{print substr(\$2,6)}'"
	echo

done
