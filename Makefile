all:
	cobc -free -x -Wall -Icopybooks src/lob_engine.cbl -o lob_engine
	cobc -free -x -Wall -Icopybooks tests/lob_test.cbl -o lob_test
test:
	./lob_test
clean:
	rm -f lob_engine lob_test *.exe *.o
