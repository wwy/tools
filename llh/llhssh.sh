#!/bin/bash


trap break 2

LLH_CMD=~/opbin/wwy/bin/llh.sh

ssh_user="$1"
ssh_str="$2"
ssh_cmd="$3"

[[ "$ssh_user" == "root" || "$ssh_user" == "rd" || "$ssh_user" == "work" || "$ssh_user" == "wwy" ]] || {
	ssh_user="root"
	ssh_str="$1"
	ssh_cmd="$2"
}
ssh_server_list=(
	`$LLH_CMD $ssh_str`
) || {
	echo ${ssh_server_list[@]}
	exit 1
}


for ((i=0;i<${#ssh_server_list[@]};i++));do

	printf "\033[0;36;40m%3d\033[1;30;40m: =============== \033[0;33;40m%-18s \033[1;30;40m===============\033[0m\n" $i ${ssh_server_list[$i]}
	ssh -p 58422 -n "$ssh_user@${ssh_server_list[$i]}" "$ssh_cmd" 2>&1 | grep -v 'Warning: Permanently added'
	echo "  --- $? ---"

done
