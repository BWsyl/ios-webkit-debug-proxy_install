#!/bin/sh

mkdir ios-webkit-debug-proxy_files
cd ios-webkit-debug-proxy_files

sudo apt-get install autoconf automake libusb-dev libusb-1.0-0-dev libplist-dev libplist++-dev usbmuxd libtool libimobiledevice-dev checkinstall

#version >= 1.2.0 needed
git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice

./autogen.sh
make
sudo checkinstall

cd ..

#libplist version >= 1.12 needed
git clone https://github.com/libimobiledevice/libplist.git
cd libplist

./autogen.sh
make
sudo checkinstall


git clone https://github.com/google/ios-webkit-debug-proxy.git
cd ios-webkit-debug-proxy

./autogen.sh
make
sudo checkinstall

sudo ldconfig #for libimobiledevice.so.6
