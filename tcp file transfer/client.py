import socket

Server_ip="127.0.0.53"
Server_host=8002
FORMAT="utf-8"

CS=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
CS.connect((Server_ip,Server_host))
file = open("sample.txt","r")
data=file.read()
CS.send("sample.txt".encode(FORMAT))
msg=CS.recv(1024)
print( msg)
CS.send(data.encode(FORMAT))
msg=CS.recv(1024)
print(msg)