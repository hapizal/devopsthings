
#!/bin/sh

mac=`ifconfig | grep ether | awk '{print $2}'`


echo 'ACTION=="add", SUBSYSTEM=="net", DRIVERS=="?*", ATTR{address}=="'$mac'", NAME="eth0"' > /lib/udev/rules.d/60-net.rules

