CC = g++

all : testps.o ps-lite/build/libps.a
	$(CC) -o testps testps.o ps-lite/build/libps.a -L./ps-lite/deps/lib -lprotobuf -lzmq -std=c++11 -lpthread

testps.o: testps.cpp ps-lite/build/libps.a
	$(CC) -c -std=c++11 testps.cpp -I./ps-lite/include 

clean: 
	rm -f *.o
	rm -f ps
