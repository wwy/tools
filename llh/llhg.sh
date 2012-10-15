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
	# $i 表示每组的第一个
	# 下面的循环，遍历出一个一个的小组
	for ((j=0;j<$size;j++));do
		num=$(($i+$j)) # 大组的组号，加小组的组号
		echo ${serlist[$num]}
	done
done
