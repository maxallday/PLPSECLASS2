#check network ping
#import requests 
import os
hostname = "www.google.com" #example
response = os.system("ping -c 1 " + hostname)
if response ==0:
    print(hostname, "is up!")
else:
    print("hostname down!")
#check dns
import socket
hostname = "www.google.com"
try:
    addr = socket.gethostbyname(hostname)
    print("IP address is: ", addr)  
except socket.gaierror:
    print("Hostname could not be resolved")     

#check network connection

'''try:
    requests.get("http://www.google.com", timeout = 2)
    print("Connection is up!")
except requests.ConnectionError:
    print("Connection is down!")

'''
