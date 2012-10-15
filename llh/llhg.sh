#!/bin/bash

serlist=(
        `cat -`
)

size=$1
group=$2
select=$3
begin_group_num=$(($select*$size))
group_interval=$(($size*$group))

[[ "$size" == "0" ]] && {
	echo "'size' cannot == $size, 'size' 'group' 'select'"
	exit 1
}
[[ "$select" -ge "$group" ]] && {
	echo "'select' cannot ge 'group', 'size' 'group' 'select'"
	exit 1
}

for ((i=$begin_group_num;i<${#serlist[@]};i+=$group_interval));do
	# $i ��ʾÿ��ĵ�һ��
	# �����ѭ����������һ��һ����С��
	for ((j=0;j<$size;j++));do
		num=$(($i+$j)) # �������ţ���С������
		echo ${serlist[$num]}
	done
done
