ping baidu.com
ifconfig
eit
exit
ssh-keygen -t rsa -C "your_email@example.com"
cd .ssh/
ls
vim id_rsa.pub 
ssh-keygen -t rsa -C "kongwei@pku.edu.cn"
vim id_rsa.pub 
ls
vi known_hosts 
exit
ssh 120.24.56.95
exit
ssh 120.24.56.95
exit
sudo apt-get update && sudo apt-get install -y build-essential git
exit
sudo apt-get update
sudo apt-get install -y build-essential git
git clone https://github.com/dmlc/ps-lite
ls
rm AdvThermal-2.0
rm -f AdvThermal-2.0
rm -rf AdvThermal-2.0
ls
rm AdvThermal-2.0.tar.gz 
cd ps-lite/
ls
vim README.md 
make -j4
cd docs/
ls
vim how_to.md 
cd ..
ls
make -j4
cd docs/
ls
vim overview.md 
cd ..
ls
make -j4
ls
cd tests/
ls
vim README.md 
ls
cd ..
ls
cd src/
ls
cd ..
ls
cd include/
ls
cd ps/
ls
cd ..
ls
cd tracker/
ls
cd ..
ls
cd tests/
ls
vi local.sh 
vim test.mk 
vim test_simple_app.cc 
vim test_kv_app.cc 
vim test_kv_app_multi_workers.cc 
vim test_connection.cc 
cd ..
ls
cd src/
ls
cd ..
cd include/
ls
cd ps/
ls
vim ps.h 
cd ..
make -j4
ls
cd tests/
ls
vim README.md 
cd ..
make test
cd tests/
ls
vim README.md 
cd ..
find test_* -type f -executable -exec ./repeat.sh 4 ./local.sh 2 2 ./{} \;
cd tests/
find test_* -type f -executable -exec ./repeat.sh 4 ./local.sh 2 2 ./{} \;
ls
vim README.md 
./local.sh 2 2
vim README.md ./{}
./local.sh 2 2 ./{}
vim local.sh 
./local 1 2 ./test_connection
./local.sh 1 2 ./test_connection
./local.sh 1 2 ./test_kv_app
./local.sh 1 2 ./test_simple_app
./local.sh 1 2 ./test_kv_app_multi_workers
ls
cd ..
ls
mkdir ps
cd ps
vim ps.cpp
g++ ps.cpp -std=c++11 -lps -lprotobuf -lzmq -o ps
cd ..
cd tests/
ls
vim test_connection.cc 
vim test.mk 
cd ..
ls
cd tests/
ls
vim lint.py 
cd ..
ls
vim Makefile 
cd make/
ls
cd ..
cd ps
ls
cd ..
mv ps distributed_work
ls
cd distributed_work/
ls
cd ..
ls include/
ls include/ps/
ls
cd deps/
;s
ls
cd lib/
ls
cd 
cd ps-lite/
ls
rm distributed_work/
rm -rf distributed_work/
ls
git log
cd
git clone git@github.com:ctliu3/dist-lr.git
git clone https://github.com/ctliu3/dist-lr.git
ls
cd dist-lr/
ls
make
cd ps-lite/
ls
cd ..
rm -rf dist-lr/
jls
ls
cd ps-lite/
ls
make -j4
cd ..
mkdir dist-dnn
cd ps
cd ps-lite/
ls
vim Makefile 
cd ..
cd dist-dnn/
ls
vim ps.cpp
ls
mv ../ps-lite/ .
sudo mv ../ps-lite/ .
ls
sudo mv ../ps-lite/ ./
sudo mv ../ps-lite ./
sudo mv ../ps-lite .
git clone https://github.com/dmlc/ps-lite
cd ps-lite/
make -j4
ls
cd ..
ls
cd ps-lite/
ls
ls build/
ls deps/
vim Makefile 
ls include/
ls include/ps/
ls include/dmlc/
ls include/ps/internal/
ls src/
ls src/windows/
ls tracker/
ls cmake/
ls build/
echo $LD_LIBRARY_PATH
echo $PATH
ls
cd deps/
ls
ls include/
ls share/
ls share/man/
ls bin/
ls
ls lib/
ls lib/pkgconfig/
ls
cd ..
ls
cd src/
s
ls
cd ..
ls
cd deps/lib/
ls
pwd
export LD_LIBRARY_PATH=/root/dist-dnn/ps-lite/deps/lib
s
ls
cd ..
ls
cd ..
ls
cd include/
pwd
export C_INCLUDE_PATH=/root/dist-dnn/ps-lite/include
export CPLUS_INCLUDE_PATH=/root/dist-dnn/ps-lite/include
cd ..
g++ ps.cpp -std=c++11 -lprotobuf -lzmq -o ps
g++ ps.cpp -std=c++11 -ps -lprotobuf -lzmq -o ps
g++ ps.cpp -std=c++11 -lps -lprotobuf -lzmq -o ps
ls
cd ps
cd ps-lite/
ls
cd tests/
ls
vim repeat.sh 
./local.sh 2 2 ./test_connection
./local.sh 2 2 ./test_kv_app
./local.sh 2 2 ./test_kv_app_multi_workers
./local.sh 2 2 ./test_simple_app
vim test.mk 
cd ..
jls
ls
echo $LD_LIBRARY_PAY
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:/root/dist-dnn/ps-lite/build
g++ ps.cpp -std=c++11 -lps -lprotobuf -lzmq -o ps
cd dist-dnn/
cd ps-lite/
ls
cd tests/
ls
vim test_kv_app.cc 
vim test.mk 
exit
cd dist-dnn/
cd ps-lite/
vim Makefile 
ls
cd src/
ls
cd ..
ls
cd make/
ls
vim ps.mk 
cd ..
ls
cd include/
ls
cd ..
ls
vim Makefile 
make
vim Makefile 
make
vim Makefile 
make
vim Makefile 
make
grep -r gatt-service.o
vim Makefile 
make
vim Makefile 
make
ls
cd ps-lite/
cd tests/
ls
cd 
cd dist-dnn/
cp ./ps-lite/tests/local.sh  .
ls
./local.sh 1 2 ./testps
ls ps-lite/deps/lib/
ll
cd ps-lite/deps/lib/
ll
cd
cd dist-dnn/
vim Makefile 
make
./local.sh 1 2 ./testps
export LD_LIBRARY_PATH=/root/dist-dnn/ps-lite/deps/lib/
./local.sh 1 2 ./testps
ps
exit
vim .bashrc 
source 
source .bashrc 
cd dist-dnn/
ls
cd ps-lite/
ls
cd build/
ls
pwd
cd
cd dist-dnn/
vim Makefile
make
vim Makefile
make
mv ps.cpp testps.cpp
vim Makefile 
make
vim Makefile 
ls ps-lite/
make
vim Makefile 
ls
make
vim testps.cpp 
vim Makefile 
make
vim testps.cpp 
make
vim testps.cpp 
make
vim testps.cpp 
make
ls
vim testps.cpp 
ps
ls
cd dist-dnn/
ls
ps
./local.sh 1 2 ./testps
export LD_LIBRARY_PATH=/root/dist-dnn/ps-lite/deps/lib/
./local.sh 1 2 ./testps
ps
./local.sh 1 2 ./testps
ls
ps
kkill 56
kill 56
kill 89
ls
ps
./local.sh 1 2 ./testps
ps
top
exit
ls
top
exit
ls
cd dist-dnn/
ls
cd ps
dc ps-lite/
ls
cd ps-lite/
ls
cd tests/
ls
cd
mpi
sudo apt-get install yorick-mpy-mpich2 
ls
mpy
mpy --help
mpy
cd ps-lite/
ls
cd tests/
ls
cd ..
ls
make
cd tests/
make
cd ..
make
cd tests/
cp test.mk Makefile
make
ls
make
rm Makefile 
cd ..
make
make clean
make
cd tests/
ls
./local.sh 1 2 ./test_kv_app
./local.sh 1 0 ./test_kv_app
./local.sh 0 2 ./test_kv_app
ps
kill 2083
kill 2084
kill 2274
top
./local.sh 0 2 ./test_kv_app
ps
./test_connection 
./test_kv_app
./local.sh 1 2 ./test_kv_app
ps
./local.sh 1 2 ./test_simple_app
ps
exit
ps
top
netstat
lsof -i 8000
netstat -an | grep 8000
lsof -i
lsof -i:8000
netstat -tunlp
top
kill 2319
kill 2330
kill 2320
kill 2321
kill 2322
kill 2343
kill 2344
kill 2345
kill 2346
top
kill 2293
top
ls
cd dist-dnn/
ls
vim testps.cpp 
ls
make
vim testps.cpp 
make
vim testps.cpp 
make
ls
./local.sh 1 2 ./testps
vim local.sh 
ls
pwd
./local.sh 1 2 ./testps
vim local.sh 
./local.sh 1 2 ./testps
ps
kill
kill 2475
kill 2477
kill 2478
ps
cd ps-lite/
ls
cd tests/
./local.sh 1 2 ./test_kv_app
ls
make
cd ..
cd ps-lite/
ls
cd tests/
./local.sh 1 2 ./test_kv_app
./local.sh 1 0 ./test_kv_app
ps
netstat
top
top
netstat
ls
cd ps-lite/
ls
cd  tests/
ls
./local_multi_workers.sh 1 2 ./test_connection
netstat
ps
ls
./local.sh 1 1 ./test_kv_app
cd ..
cd 
cd dist-dnn/
ls
vim testps.cpp 
./local.sh 1 2 ./testps
vim testps.cpp 
make
./local.sh 1 2 ./testps
vim testps
vim testps.cpp 
kill 1
ls
ps
kill 2946
kill 2296
kill 2496
ps
exit
ifconfig
vim .ssh/authorized_keys 
service ssh start
netstat
netstat -ntulp 
service ssh status 
ps -e | grep ssh
vim /etc/ssh/sshd_config 
service ssh  restart 
ssh 10.2.57.161
cat .ssh/id_rsa.pub 
ssh 10.128.152.63
ssh kongwei@10.128.152.63
cd /usr/local/mpich/
ls
vim servers
mpiexec -n 10 -f servers ./examples/cpi
mpirun -n 10 -f servers ./examples/cpi
mpirun -n 10 ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
ls
vim servers 
mpirun -n 10 -f servers ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
cd
vim /etc/ssh/sshd_config 
service ssh restart 
ssh localhost 
cd -
mpirun -n 10 -f servers ./examples/cpi
ssh 10.128.152.63
ifconfig
ssh 10.2.57.161
service ssh restart 
cd
vim .ssh/id_rsa.pub 
vim .ssh/authorized_keys 
ifconfig
service iptables status
chkconfig
vim /etc/ssh/sshd_config 
service ssh restart 
vim /etc/ssh/sshd_config 
service ssh status
vim /etc/hostname 
vim /etc/hosts
service ufw status
netstat -nat | grep 22
ifconfig
ssh kongwei@10.128.152.63
ssh 10.128.152.63
cd mpich-3.0.4/
ls
cd examples/
mpirun -n 10 -f servers ./examples/cpi
ls
cd /usr/local/mpich/
ls
mpirun -n 10 -f servers ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
vim servers 
mpirun -n 10 -f servers ./examples/cpi
mpiexec -n 10 -f servers ./examples/cpi
cd
ls
cd dist-dnn/
ls
cd
cd ps-lite/
;s
ls
cd tracker/
ls
python3 dmlc_mpi.py 
cd
cd dist-dnn/
ls
python3 tracker/dmlc_mpi.py -n 2 -s 1 ./testps
export LD_LIBRARY_PATH=/root/dist-dnn/ps-lite/deps/lib/
python3 tracker/dmlc_mpi.py -n 2 -s 1 ./testps
mpirun
python3 tracker/dmlc_ssh.py -n 2 -s 1 ./testps
vim servers
cp /usr/local/mpich/servers .
python3 tracker/dmlc_ssh.py -n 2 -s 1 ./testps --hostfile servers 
ps
vim servers 
python3 tracker/dmlc_ssh.py -n 2 -s 1 ./testps --hostfile servers 
ls
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
vim servers 
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
ssh 10.128.152.63
ifconfig
ssh 10.128.152.63
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
cd
scp -r ./dist-dnn/ root@10.128.152.63:~
cd dist-dnn/
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
python3 tracker/dmlc_ssh.py -n 1 -s 1 -H servers ./testps
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
python3 tracker/dmlc_mpi.py -n 2 -s 1 -H servers ./testps
python3 tracker/dmlc_mpi.py -n 2 -s 1 -H servers ./testps --log-file=./log
vim log 
python3 tracker/dmlc_mpi.py -n 2 -s 1 -H servers ./testps --log-file=./log
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
make
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
cd ps-lite/
cd tests/
ls
cd 
cd dist-dnn/
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./ps-lite/tests/test_kv_app_multi_workers
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./ps-lite/tests/test_kv_app
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./ps-lite/tests/test_connection
vim local.sh 
./local.sh 
./local.sh 1 0 ./testps
./local.sh 1 2 ./testps
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
cd
cat .ssh/id_rsa.pub 
cd dist-dnn/
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps
vim servers 
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps --sync-dir
.
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps --sync-dir .
ssh daoshou@120.77.38.18
exit
cd dist-dnn/
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps --sync-dir .
export LD_LIBRARY_PATH=/root/dist-dnn/ps-lite/deps/lib/
python3 tracker/dmlc_ssh.py -n 2 -s 1 -H servers ./testps --sync-dir .
cd
vim .ssh/id_rsa.pub 
cd dist-dnn/
ls
cd ..
ls
rm lo*
rm Makefile 
rm test*
ls
rm servers 
ls
ssh kongwei@10.128.152.63
vim .ssh/authorized_keys 
ssh 10.128.152.63
top
ifconfig
top
ps -e | grep test
kill 1212
kill 1213
kill 1304 1305 1400 1401 1492 1493
ps -e | grep test
kill 1588 1589 1602 1641
ps -e | grep test
kill
kill 1696
kill
ps -e | grep test
kill 1780 1782 1797 1826
ps -e | grep test
kill 1876
ps -e | grep test
kill 1889 1896
ps -e | grep test
cd dist-dnn/
vim testps.cpp
ps -e | grep test
ifconfig
cd
ssh daoshou@120.77.38.18
ficonfig
ifconfig
ssh daoshou@120.77.38.18
ssh-copy-id -i ~/.ssh/id_rsa.pub daoshou@120.77.38.18
ssh daoshou@120.77.38.18
cd dist-dnn/
ls
ifconfig
ls
cd ..
ls
cd dist-dnn/
ls
cd 
ls
ssh daoshou@120.77.38.18
exit
