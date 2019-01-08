#! /bin/bash
brew install openssl libuv cmake zlib
git clone https://github.com/uWebSockets/uWebSockets 
cd uWebSockets
git checkout e94b6e1
patch CMakeLists.txt < ../cmakepatch.txt
mkdir build
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig 
cd build
OPENSSL_VERSION=`openssl version -v | cut -d' ' -f2`
# cmake -DOPENSSL_ROOT_DIR=$(brew --cellar openssl)/$OPENSSL_VERSION -DOPENSSL_LIBRARIES=$(brew --cellar openssl)/$OPENSSL_VERSION/lib ..
cmake -DOPENSSL_ROOT_DIR=$(brew --cellar openssl)/1.0.2q -DOPENSSL_LIBRARIES=$(brew --cellar openssl)/1.0.2q/lib ..
# get OPENSSL_VERSION 1.0.2p but in fact 1.0.2q
make 
sudo make install
cd ..
cd ..
sudo rm -r uWebSockets
