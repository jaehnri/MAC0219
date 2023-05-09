CC     = gcc
CFLAGS = -Wall -pedantic -g -O2
RM     = rm -rf
print  = echo

all: main

main: main.o matrix.o time_extra.o
	$(CC) $(CEXTRA) $(CFLAGS) -o $@ $^

.PHONY: test
test: test.o matrix.o time_extra.o
	$(CC) $(CEXTRA) $(CFLAGS) -o $@ $^
	./test

main.o: main.c time_extra.h matrix.h
	$(CC) $(CEXTRA) $(CFLAGS) -c $<

matrix.o: matrix.c matrix.h
	$(CC) $(CEXTRA) $(CFLAGS) -c $<

time_extra.o: time_extra.c time_extra.h
	$(CC) $(CEXTRA) $(CFLAGS) -c $<

load-test: main
	./load-test.sh

collect-results:
	cat results.txt | grep matrix_dgemm_0 | cut -d ' ' -f 9
	cat results.txt | grep matrix_dgemm_1 | cut -d ' ' -f 9

.PHONY: clean
clean:
	$(RM) *.o main test
