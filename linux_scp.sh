#!/usr/bin/expect

spawn scp ./userdata.sql user@host:/opt/data
expect "password:"
send "123456\r"

interact
