#!/usr/bin/bash

echo "Welcome to SGD Office"

echo -e "\nEnter user: "

read user

echo -e "\nEnter password: "

read -s password

echo -e "\nWhat do you want: "

echo -e "\n1) Add New Employee"

echo -e "\n2) Delete Existing Employee"

echo -n -e "\nEnter choice: "

read choice

execute_command=false

host="localhost"

if [ $choice == 1 ]; then
	echo -e "\nEmployee Full Name?"
	read full_name
	echo -e "\nEmployee Phone Number?"
	read phone_number
	echo -e "\nEmployee SSN?"
	read ssn
	echo -e "\nEmployee Password?"
	read -s employee_pass
    hashed=$(node index.js $employee_pass)
	command="insert into employee(full_name, phone_number, ssn, password) values('$full_name', '$phone_number', '$ssn', '$hashed');"
	execute_command=true

elif [ $choice == 2 ]; then
	echo -e "\nEnter Employee SSN: "
	read ssn
	echo -n -e "\nDo you confirm to delete employee with SSN $ssn? (Y|N): "
	read confirm
	if [ "$confirm" == "Y" ]; then
		command="delete from employee where ssn = $ssn"
		execute_command=true
	else
		echo -e "\nTry again later!"
	fi
		
else
	echo -e "\nTry again later!"
fi
	
if [ $execute_command == true ]; then
	mysql --user="$user" --password="$password" --database="attendance" --execute="$command"
fi	