ps-lite version @ 36b015f
based on https://github.com/ctliu3/dist-lr
this is a demo project of full-connected model based on ps-lite

1. cd ps-lite  
2. compile ps-lite:
     make -j4  
3. back to mini_tensorflow:
     cd ..
4. split and construct data:
     cd examples
     python3 gen_data.py
5. back to mini_tensorflow:
     cd ..
6. compile project:
     mkdir build
     cd build
     cmake ..
     make
7. perform:
     cd ../examples
     ./local.sh 1 4 ../bin/distlr

if protobuf error:
refer to https://leveragebigdata.wordpress.com/2015/10/08/install-protocol-buffer-2-5-0/


git clone --recursive #this repo#

requirements:
##[zeromq]

#install by typing cmds:

#echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" >> /etc/apt/sources.list

#wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key -O- | sudo apt-key add

#apt-get install libzmq3-dev

#cmake .

#make
