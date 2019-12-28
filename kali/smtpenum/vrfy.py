#!/usr/bin/bash

import socket
import sys

if len(sys.argv) != 2:
	print "Usage: vrfy.py <username>"
	sys.exit(0)

s=socket.socket(socket.AF_INET, socket.SOCK_STREAM) #create a socket
connect=s.connect(('10.11.1.155',25))#connect to server
banner=s.recv(1024)			#recieve banner
print banner				
s.send('VRFY ' + sys.argv[1] + '\r\n') #VRFY a user
result=s.recv(1024)
print result
s.close()			#close the connection
