#!/usr/bin/expect
#h auto-login script.
#run this on a bunch of nodes, such as from a file with the hostnames or ip's..
#for i in `cat iplist`; do ./thisscript.sh $i user password command1; done
# disable ssh rsa key prompt: -o StrictHostKeyChecking=no

set timeout 5

set ip [lindex $argv 0]

set user "user"

set password "password"

set command1 [lindex $argv 1]  #command is passed on the command line, see example above.

spawn ssh -o StrictHostKeyChecking=no "$user\@$ip" $command1

expect "Password:"

sleep 5

send "$password\r";

interact  # in this case, we don't interact, it exits on completion of command1
