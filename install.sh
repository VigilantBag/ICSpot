#Install OpenPLC 
#cd OpenPLC
#docker build -t openplc:v2 .
docker network create --subnet=172.25.0.0/16 mynet
docker pull nikhilkc96/openplc
docker run -d --rm --privileged -p 8080:8080 -p 502:502 --net mynet --ip 172.25.0.5 nikhilkc96/openplc

cd ..
#Run ScadaBR
docker pull nikhilkc96/scadabr:latest
docker run --privileged -p 5000:8080 -p 3306:3306 --net mynet --ip 172.25.0.6 --name ScadaBR --restart always -itd nikhilkc96/scadabr:latest


#Install Honeyed 
cd Honeyd
sudo apt-get -y install libevent-dev libdumbnet-dev libpcap-dev libpcre3-dev libedit-dev bison flex libtool automake zlib1g-dev python net-tools farpd
cd Honeyd/
# wget https://src.fedoraproject.org/repo/pkgs/libdnet/libdnet-1.12.tgz/9253ef6de1b5e28e9c9a62b882e44cc9/libdnet-1.12.tgz
# tar zxvf libdnet-1.12.tgz
# cd libdnet-1.12/
# ./configure CFLAGS=-fPIC; make
# ln -s /usr/lib64/libdnet.so.1.0.1 /usr/lib64/libdnet.1
chmod +x ./autogen.sh
./autogen.sh
./configure
make
cd ..
sudo honeyd -d -p nmap-os-db -i br-5f2535b2a023 -l /root/ICSpot/Logging/honeyed.log -s /root/ICSpot/Logging/servicelog.log -f honeyd.conf 167.172.36.51 -u 0 -g 0 --disable-webserver
sudo farpd -d -i br-5f2535b2a023 167.172.36.51