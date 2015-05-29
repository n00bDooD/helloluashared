CC=gcc
CFLAGS=-c $(pkg-config lua5.1 --cflags) -fpic
LDFLAGS=-shared -fpic
SOURCES=$(wildcard *.c)
HEADERS=$(wildcard *.h)
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))
EXECUTABLE=libhello.so

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm -f $(OBJECTS) $(EXECUTABLE)

debug: $(SOURCES) $(EXECUTABLE)
	gdb -tui ./$(EXECUTABLE)

valgrind: $(SOURCES) $(EXECUTABLE)
	valgrind ./$(EXECUTABLE)

format: 
	astyle -A8t4PHk1jxC85 $(SOURCES) $(HEADERS)
	rm -rf *.[chCH].orig
