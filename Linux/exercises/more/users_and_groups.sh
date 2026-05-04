#!/bin/bash
readarray accounts< <(cat ./users.txt)

for account in "${accounts[@]}"
do
	#echo $account
	user=$(echo $account | cut -d: -f1)
	group=$(echo $account | cut -d: -f2)
	if [[ -z "$(grep -w $group /etc/group)" ]]
	then
		groupadd $group
		echo "Group $group added successfully!"
	else
		echo "Group $group already exists!"
	fi

	if [[ -z "$(grep -w $user /etc/passwd)" ]]
	then
		useradd -G $group $user
		echo "User $user added successfully"
	else
		echo "User $user already exists!"
	fi
	echo "##################"
	sleep 1
done
