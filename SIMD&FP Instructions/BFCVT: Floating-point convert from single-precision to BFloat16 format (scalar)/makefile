LDFLAGS = -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -mcpu apple-m2

all: bfcvt

bfcvt: bfcvt.o
	ld -o bfcvt bfcvt.o ${LDFLAGS}

bfcvt.o: bfcvt.s
	as -g -mcpu=apple-m2 -o bfcvt.o bfcvt.s

clean:
	rm -f *.o bfcvt
