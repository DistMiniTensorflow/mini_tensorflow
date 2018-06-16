this is a demo project of full-connected model based on ps-lite


git clone --recursive #this repo#

requirements:
[zeromq]
install by typing cmds:
-------------------------------------------------
echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" >> /etc/apt/sources.list
wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key -O- | sudo apt-key add
apt-get install libzmq3-dev
-------------------------------------------------

cmake .
make
