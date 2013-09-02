sudo bluez-simple-agent hci0 00:07:80:44:A2:E1
sudo bluez-test-device trusted 00:07:80:44:A2:E1 yes
#sudo rfcomm connect hci0 00:07:80:44:A2:E1
#to know the supporting protocols
#sudo sdptool browse 00:07:80:44:A2:E1

sudo rfcomm release 0
sudo rfcomm bind /dev/rfcomm0 00:07:80:44:A2:E1
sudo chmod o+rw /dev/rfcomm0
sudo stty -F /dev/rfcomm0 115200 cs8 cread
