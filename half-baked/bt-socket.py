import bluetooth
from time import sleep

bd_addr = "00:07:80:44:A2:E1"

port = 1
frame_size=60
sleep(1)
#ByteStringToSend = "\x02\x15\x01\x06\x03"
ByteStringToSend = "\x14"
socket=bluetooth.BluetoothSocket(bluetooth.RFCOMM)
socket.connect((bd_addr, port))
print "socket connection established\n"

socket.send(ByteStringToSend)

data = socket.recv(frame_size)
print 'length of data is %s with frame size %s' %(len(data),frame_size)
for each in range(1,len(data)):
	print 'data[%s] =' %(each), ord(data[each])
# receiving 35(int) or 0x23(hex) as first value data array



sleep(1)
socket.close()
