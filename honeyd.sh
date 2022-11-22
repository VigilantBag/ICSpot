cd Honeyd
sudo apt-get -y install libevent-dev libdumbnet-dev libpcap-dev libpcre3-dev libedit-dev bison flex libtool automake zlib1g-dev python net-tools farpd libdnet
cd Honeyd/
chmod +x ./autogen.sh
./autogen.sh
./configure
make
cd ..
sudo honeyd -d -p nmap-os-db -i br-5f2535b2a023 -l /root/ICSpot/Logging/honeyed.log -s /root/ICSpot/Logging/servicelog.log -f honeyd.conf 172.25.0.7 -u 0 -g 0 --disable-webserver
sudo farpd -d -i br-5f2535b2a023 172.25.0.7