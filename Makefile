CC = g++

all: lr.o util.o main.o ps-lite/build/libps.a
	$(CC) -o distlr lr.o util.o main.o ps-lite/build/libps.a -L./ps-lite/deps/lib -lprotobuf -lzmq -std=c++11 -lpthread

lr.o: include/data_iter.h include/lr.h ps-lite/build/libps.a
	$(CC) -c -std=c++11 src/lr.cc -I./ps-lite/include -I./include

util.o: include/util.h ps-lite/build/libps.a
	$(CC) -c -std=c++11 src/util.cc -I./ps-lite/include -I./include

main.o: include/util.h include/data_iter.h include/lr.h ps-lite/build/libps.a
	$(CC) -c -std=c++11 src/main.cc -I./ps-lite/include -I./include

clean:
	rm -rf *.o
	rm distlr
