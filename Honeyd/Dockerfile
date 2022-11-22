FROM ubuntu:18.04

#clone repo

#RUN git clone https://github.com/DataSoft/Honeyd
COPY /Honeyd /usr/local/src/Honeyd
WORKDIR /usr/local/src/Honeyd

RUN apt-get install autotools-dev libreadline-dev libevent-dev libdumbnet-dev libpcap-dev libpcre3-dev libedit-dev bison flex libtool automake zlib1g-dev 

RUN ./autogen.sh
RUN ./configure

RUN make

RUN sudo make install
RUN sudo apt-get install farpd
RUN sudo honeyd -d -p nmap-os-db -i mynet -l honeyd.log -f honeyd.conf 172.25.0.7 –disable-webserver

