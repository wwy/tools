#!/bin/bash


trap break 2

LLH_CMD=~/opbin/wwy/bin/llh.sh

ssh_src_dir="$1"
ssh_user="$2"
ssh_str="$3"
ssh_dst="$4"


ssh_server_list=(
	`$LLH_CMD $ssh_str`
) || {
	echo ${ssh_server_list[@]}
	exit 1
}


for ((i=0;i<${#ssh_server_list[@]};i++));do

	printf "\033[0;36;40m%3d\033[1;30;40m: =============== \033[0;33;40m%-18s \033[1;30;40m===============\033[0m\n" $i ${ssh_server_list[$i]}
	scp -i ~/.ssh/id_rsa_hd -P 58422 -rp -o StrictHostKeyChecking=no -o PasswordAuthentication=no "$ssh_src_dir" "$ssh_user@${ssh_server_list[$i]}:$ssh_dst"
	echo "  --- $? ---"

done
