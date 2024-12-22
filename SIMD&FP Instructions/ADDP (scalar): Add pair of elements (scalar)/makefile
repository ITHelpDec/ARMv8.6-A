LDFLAGS = -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

all: addp

addp: addp.o
	ld -o addp addp.o ${LDFLAGS}

addp.o: addp.s
	as -g -arch arm64 -o addp.o addp.s

clean:
	rm -f *.o addp
