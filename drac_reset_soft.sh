#!/usr/bin/expect

#usage:
#scriptname hostname user pass

#If it all goes pear shaped the script will timeout after 20 seconds.
set timeout 20
#First argument is assigned to the variable name
set name [lindex $argv 0]
#Second argument is assigned to the variable user
set user [lindex $argv 1]
#Third argument is assigned to the variable password
set password [lindex $argv 2]
#This spawns the telnet program and connects it to the variable name
spawn telnet $name 
#The script expects login
expect "Login:" 
#The script sends the user variable
send "$user\r"
sleep 2
#The script expects Password
expect "Password:"
#The script sends the password variable
send "$password\r"
sleep 4
send "racadm clrraclog\r"
expect "OK"
sleep 3
send "racadm racreset soft\r"
expect "OK"
#This hands control of the keyboard over two you (Nice expect feature!)
#interact
sleep 3
#Disconnect ctrl+] and crtl+C
send "\x1d"
send "\003"

