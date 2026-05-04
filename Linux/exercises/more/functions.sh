#!/bin/bash


function print_something () {
	echo "Im a simple function."
}

display_something () {
	echo "Hello functions!"
}

create_files () {
	echo "Creating $1"
	touch $1
	chmod 400 $1
	echo "Creating $2"
	touch $2
	chmod 600 $2
}

print_something
display_something
create_files aa.txt bb.txt
