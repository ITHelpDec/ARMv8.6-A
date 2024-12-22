LDFLAGS = -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

all: addv

addv: addv.o
	ld -o addv addv.o ${LDFLAGS}

addv.o: addv.s
	as -g -arch arm64 -o addv.o addv.s

clean:
	rm -f *.o addv
