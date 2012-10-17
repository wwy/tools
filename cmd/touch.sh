#!/bin/bash


file=$1

#sha="#!/bin/bash"
sha="#!/bin/zsh"
create_time="`date +'%F %T'`"
author="wwy"
set_head="# set -ue;set -o pipefail"


cat > $file <<- End
	$sha
	#
	# Create time: $create_time
	# Author: $author

	$set_head

End

vim + $file
