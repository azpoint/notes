#!/bin/bash


function rectangle_area () {
	local width=$1
	local height=$2
	echo -e "\n#########"
	
	echo "$(($width * $height))"

}

rectangle_area 8 7
rectangle_area 8 8
rectangle_area 5 5
rectangle_area 2 6
